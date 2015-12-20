require 'spec_helper'

describe Starfighter do
  before do
    Starfighter.configure { |c| c.api_key = 'Totally valid API key' }
  end

  describe '#up' do
    it 'returns true if the Starfighter API is available' do
      expect(Starfighter).to be_up
    end

    it 'returns false if the Starfighter API is not available' do
      stub_request(:get, "https://api.stockfighter.io/ob/api/heartbeat").
        to_return(:status => 200, :body => "{\"ok\":false,\"error\":\"\"}", :headers => {})

      expect(Starfighter).to_not be_up
    end
  end
end
