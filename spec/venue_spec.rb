require 'spec_helper'

describe Starfighter::Venue do
  describe '#up?' do
    let(:venue) { 'sweetvenue' }
    let(:subject) { Starfighter::Venue.new(venue) }

    def mock_venue_status(up)
      stub_request(:get, "https://api.stockfighter.io/ob/api/venues/#{venue}/heartbeat").
        to_return(:status => 200, :body => "{\"ok\":#{up},\"error\":\"\"}", :headers => {})
    end

    it 'returns true if the venue is up' do
      mock_venue_status(true)
      expect(subject).to be_up
    end

    it 'returns false if the venue is down' do
      mock_venue_status(false)
      expect(subject).to_not be_up
    end
  end
end
