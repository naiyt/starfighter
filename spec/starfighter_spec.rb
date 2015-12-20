require 'spec_helper'

describe Starfighter do
  def mock_starfigher_status(up)
    stub_request(:get, "https://api.stockfighter.io/ob/api/heartbeat").
      to_return(:status => 200, :body => "{\"ok\":#{up},\"error\":\"\"}", :headers => {})
  end

  describe '#up?' do
    it 'returns true if the Starfighter API is available' do
      mock_starfigher_status(true)
      expect(Starfighter).to be_up
    end

    it 'returns false if the Starfighter API is not available' do
      mock_starfigher_status(false)
      expect(Starfighter).to_not be_up
    end
  end
end
