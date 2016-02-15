require 'csv'
require 'markaby'

begin
  data = CSV.read('report.csv')
rescue Errno::ENOENT
  puts 'Report.CSV File not availible.. Skipping HTML Compilation'
  exit(0)
end

def count_passing_steps(data)
  data.count { |x| x[3] =~ /passed/i }
end

def count_failing_steps(data)
  data.count { |x| x[3] =~ /failed/i }
end

def count_skipped_steps(data)
  data.count { |x| x[3] =~ /skipped/i }
end

def get_execution_time(data)
  total = 0.0
  hourminsec = []
  data.collect { |x| total += x.last.to_f }

  hourminsec[0] = total.to_i / 3600
  hourminsec[1] = total.to_i % 3600 / 60
  hourminsec[2] = total.to_i % 3600 % 60

  hourminsec
end

def get_features(data)
  features = []
  data.each do |item|
    features.push(item[0])
  end
  # puts features.uniq.inspect
  features.uniq
end

def get_feature_stats(features_list, data)
  arr = []
  features_list.each do |feature|
    result = []
    items = get_feature_data(data, feature)
    # puts feature
    # puts data.inspect
    result.push(feature)
    # puts items.inspect
    result.push(items.length)
    result.push(count_passing_steps(items))
    result.push(count_failing_steps(items))
    result.push(count_skipped_steps(items))
    result.push(get_execution_time(items))
    result.push(((count_passing_steps(items).to_f + count_failing_steps(items).to_f) / items.length) * 100.0)
    result.push((count_passing_steps(items).to_f / items.length) * 100.0)
    arr.push(result)
  end
  # puts arr.inspect
  arr
end

def get_feature_data(data, feature_name)
  data.reject { |x| x[0] !~ /#{feature_name}/i }
end

def get_failures(data)
  data.reject { |x| x[3] !~ /failed/i }
end

mab = Markaby::Builder.new
mab.html do
  @auto_validation = false
  head do
    tag! :link, rel: 'stylesheet', type: 'text/css', href: 'reports.css'
  end
  body do
    h1 "Automation Report - #{Time.now.strftime('%d  %B %Y')} At #{Time.now.strftime('%H:%M')}"

    h2 "Feature Set: #{ENV['TAG']} on Environment #{ENV['HOST']}"

    h3 'Report Overview'
    table.data do
      tr do
        th 'Total Steps'
        th 'Steps Passed'
        th 'Steps Failed'
        th 'Steps Skipped'
        th 'Time Taken'
        th 'Execution %'
        th 'Passing %'
        th 'VR'
      end
      tr do
        td data.length
        td count_passing_steps(data)
        td count_failing_steps(data)
        td count_skipped_steps(data)
        td "#{get_execution_time(data)[0]} Hours, #{get_execution_time(data)[1]} Minutes, #{get_execution_time(data)[2]} Seconds"
        td (((count_passing_steps(data).to_f + count_failing_steps(data).to_f) / data.length) * 100.0).round(2)
        td ((count_passing_steps(data).to_f / data.length) * 100.0).round(2)
        td do
          tag! :progress, value: ((count_passing_steps(data).to_f / data.length) * 100.0).to_i, max: '100'
        end
      end
    end

    div.box do
      h3 'Feature Overview'
      table.data do
        tr do
          th 'Feature Name'
          th 'Feature Steps'
          th 'Feature Steps Passed'
          th 'Feature Steps Failed'
          th 'Feature Steps Skipped'
          th 'Feature Execution Time'
          th 'Feature Execution %'
          th 'Feature Passing %'
        end
        feature_stats = get_feature_stats(get_features(data), data)
        feature_stats.each do |feature|
          tr do
            td feature[0]
            td feature[1]
            td feature[2]
            td feature[3]
            td feature[4]
            td "#{feature[5][0]} Hours, #{feature[5][1]} Minutes, #{feature[5][2]} Seconds"
            td feature[6].round(2)
            td feature[7].round(2)
            td do
              tag! :progress, value: feature[7].to_i, max: '100'
            end
          end
        end
      end
    end

    div.box do
      h3 'Failing Steps'

      failures = get_failures(data)
      if failures.length != 0
        table.failureTable do
          tr do
            th 'Feature Name'
            th 'Scenario Name'
            th 'Scenario Step'
            th 'Exception Message'
            th 'Screenshot'
          end
          failures.each do |failure|
            tr do
              td failure[0]
              td failure[1]
              td failure[2]
              td failure[4]
              td do
                img src: failure[5]
              end
            end
          end
        end
      else
        h3 'No Failures Present in this run!'
      end
    end

    div.box do
      h3 'Feature Breakdown'

      features = get_features(data)
      features.each do |feature|
        div.subbox do
          h4 feature
          featureData = get_feature_data(data, feature)
          table.featureTable do
            tr do
              th 'Scenario Name'
              th 'Scenario Step'
              th 'Passed/Failed/Skipped'
              th 'Time Taken (s)'
              th 'Exception Message'
              th 'Screenshot'
            end
            featureData.each do |fData|
              tr do
                td fData[1]
                td fData[2]
                td.passed 'Passed' if fData[3] =~ /passed/i
                td.skipped 'Skipped' if fData[3] =~ /skipped/i
                td.failed 'Failed' if fData[3] =~ /failed/i
                td fData.last.to_f.round(2)
                if fData[3] =~ /failed/i
                  td fData[4]
                else
                  td 'N/A'
                end
                if fData[3] =~ /failed/i
                  td do
                    img src: fData[5]
                  end
                else
                  td 'N/A'
                end
              end
            end
          end
        end
      end
    end
  end
end

# file_path = 'C:\Automation-Reports\VW\Front-End'
# file_name = "ENV['MODE']#{Time.now.strftime("%d-%m-%Y-%H-%M")}.html"
# STDOUT.puts ENV['ALL_TAGS']
File.open("html-results/#{ENV['ALL_TAGS'].gsub(/(\@|\s)/, '')}.html", 'w') do |file|
  file.write(mab.to_s)
end

# puts "HTML Report #{file_name} generated!"
