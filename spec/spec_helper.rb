require 'starfighter'
require 'pry'
require 'pry-nav'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    Starfighter.configure { |c| c.api_key = 'A totally valid API key' }
  end
end
