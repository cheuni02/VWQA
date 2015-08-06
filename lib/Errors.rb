# The default/fallback that the errors inherit from, please don't use this!
class TestError < StandardError
  def initialize(message = "Fail: Reason not given")
  	super(message)
  end
end

# For readability, please state a reason for the assertion failure within the step definition
# Example: raise AssertionError, "Unexpected number of items in list" unless <condition>
class AssertionError < TestError
  def initialize(message = "Fail: Assertion failed")
  	super(message)
  end
end

# This is used when you're expecting an element to have a certain attribute (eg enabled/disabled)
class InvalidElementStateError < TestError
  def initialize(message = "Fail: Element is in an invalid state")
  	super(message)
  end
end

class NilReturnedError < TestError
  def initialize(message = "Fail: No element or value returned")
  	super(message)
  end
end

class ValidationError < TestError
  def initialize(message = "Fail: Unexpected behaviour from validation")
  	super(message)
  end
end

class ElementNotPresentError < TestError
  def initialize(message = "Fail: Element not found")
  	super(message)
  end
end

class PageNotLoadedError < TestError
  def initialize(message = "Fail: Page has not loaded")
  	super(message)
  end
end
