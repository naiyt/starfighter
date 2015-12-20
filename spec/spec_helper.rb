require 'starfighter'
require 'pry'
require 'pry-nav'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "https://api.stockfighter.io/ob/api/heartbeat").
      to_return(:status => 200, :body => "{\"ok\":true,\"error\":\"\"}", :headers => {})
  end
end
