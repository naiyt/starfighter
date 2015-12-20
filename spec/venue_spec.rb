require 'spec_helper'

describe Starfighter::Venue do
  let(:venue) { 'sweetvenue' }
  let(:subject) { Starfighter::Venue.new(venue) }

  describe '#up?' do
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

  describe '#stocks' do
    before do
      stub_request(:get, "https://api.stockfighter.io/ob/api/venues/#{venue}/stocks").
        to_return(:status => 200, :body => "{\"ok\":true, \"symbols\": [{\"name\": \"ABC Co\", \"symbol\": \"ABC\"}]}", :headers => {})
    end

    it 'returns a list of available stocks' do
      expect(subject.stocks).to eq([{'name' => 'ABC Co', 'symbol' => 'ABC'}])
    end

    it 'raises an exception if there is a problem' do
      skip('Implement exceptions for failed call to Venue#stocks')
    end

    describe 'caching' do
      before do
        subject.stocks
        stub_request(:get, "https://api.stockfighter.io/ob/api/venues/#{venue}/stocks").
          to_return(:status => 200, :body => "{\"ok\":true, \"symbols\": [{\"name\": \"123 Co\", \"symbol\": \"123\"}]}", :headers => {})
      end

      it 'caches calls to stocks' do
        expect(subject.stocks).to eq([{'name' => 'ABC Co', 'symbol' => 'ABC'}])
      end

      it 'clears the cache and refreshes if you pass in true' do
        expect(subject.stocks(true)).to eq([{'name' => '123 Co', 'symbol' => '123'}])
      end
    end
  end
end
