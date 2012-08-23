require 'rspec'
RSpec.configure do |config|
  config.mock_with :rspec
end

require File.join(File.dirname(__FILE__), "..", "lib", "rebay")

Rebay::Api.configure do |rebay|
  rebay.app_id = 'test'
  rebay.base_url = 'http://open.api.sandbox.ebay.com/shopping'
end