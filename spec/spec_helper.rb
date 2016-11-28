$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "factory_girl"
require "stringio"
require "simplecov"

SimpleCov.start

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.find_definitions
  end
end

def capture_stdout(&block)
  original_stdout = $stdout
  $stdout         = fake = StringIO.new

  begin
    yield
  ensure
    $stdout = original_stdout
  end

  fake.string
end

def capture_stderr(&block)
  original_stderr = $stderr
  $stderr         = fake = StringIO.new

  begin
    yield
  ensure
    $stderr = original_stderr
  end

  fake.string
end
