$LOAD_PATH << File.expand_path('../..', __FILE__)

require 'pry'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.color = true
  config.tty = true
  config.formatter = :documentation
end
