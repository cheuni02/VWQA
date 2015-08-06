require 'csv'
#require 'cucumber/formatter/io'
#require 'cucumber'

module CsvFormatter
	class CsvReport
	#include Io
		def initialize(runtime, io, options)
			@io = io
			@runtime = runtime
			@feature_number = 0
			@scenario_number = 0
			@step_number = 0
			#@content = Nokogiri::XML::Builder.new
			@CSVData = []
			@baseScenario = ""
			@skip = false
			@inOutline = false
			@screenshots = []
		end

		def embed(src, mime_type, label)
			#STDOUT.puts src
			case(mime_type)
			when /^image\/(png|gif|jpg|jpeg)/
				@screenshots.push src
				#STDOUT.puts src
			end
		end


		def feature_name(keyword, name)
			#STDOUT.puts name
			lines = name.split(/\r?\n/)
			@feature_name = "#{keyword}: #{lines[0]}"
		end

		def before_background(step)
			@inBackground = true
		end

		def background_name(keyword, name, file_colon_line, source_indent)
			@backgroundName = "#{keyword}: #{name.strip}"
			@listing_background = true
			#@skip = false
		end

		def after_background(step)
			@inBackground = false
			@CSVData << @dataBlock
		end


		def scenario_name(keyword, name, file_colon_line, source_indent)
			if keyword =~ /outline/i
				@baseScenario = "#{keyword}: #{name.strip}"
				#puts "0utline"
				@skipSteps = true
			else
				#@inOutline = false
				@scenario_name = "#{keyword}: #{name.strip}"
				@skipSteps = false
				@skip = false
			end
			@listing_background = false
		end

		def before_steps(step)
			@dataBlock = []
		end

		def before_step(step)
			@dataSet = [@feature_name, @scenario_name, nil, nil, nil, nil, nil]
			@startTime = Time.now.to_f
		end

		def before_outline_table(outline_table)
			@inOutline = true
		end

		def after_outline_table(outline_table)
			@inOutline = false
		end

		def after_step_result(keyword, step_match, multiline_arg, status, exception, source_indent, background, file_colon_line)
			stepName = step_match.format_args(lambda{|param| "[#{param}]"})
			if (@inOutline)
				@dataSet[1] = "#{@baseScenario} #{@dataSet[1]}"
			elsif (@inBackground)
				@dataSet[1] = "#{@backgroundName}"
			elsif background && !(@listing_background)
				#puts "Skippered!"
				@skip = true
			end
			@dataSet[2] = "#{keyword}#{stepName}"
			@dataSet[3] = status.to_s

			if status == :failed
				@fail = true
				@dataSet[4] = "#{exception.message.delete("\n")} [#{exception.class}]"
			end
			#STDOUT.puts @dataSet.inspect
		end

		def after_step(step)
			@dataSet[6] = (Time.now.to_f - @startTime).round(2)
			if !(@skip) && !(@skipSteps)
				#STDOUT.puts @dataSet
				@dataBlock << @dataSet
			end
			@skip = false
		end

		def after_feature_element(feature_element)
			if !(@skip)
				#if @fail
				#	@dataBlock.each do |d|
				#		d[5] = @screenshot
				#	end
				#end
				#@fail = false
				index = 0
				@dataBlock.each do |item|
					if item[3] =~ /failed/i && @screenshots[index] != nil
						item[5] = @screenshots[index]
						index += 1
					end
				end
				@screenshots.clear
				@CSVData << @dataBlock
			end
		end

		def after_features(feature)
			@CSVData.flatten!(1)
			#STDOUT.puts @CSVData.inspect
			if @io != nil
				STDOUT.puts "Writing CSV..."
				CSV.open(@io, "w") do |csv|
					@CSVData.each do |row|
						csv << row
					end
				end
			end
			#f =  @io.to_s
			#file = File.open(f, "wb")
			#file.close
		end

	end
end
