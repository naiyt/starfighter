require 'spec_helper'

describe Starfighter do
  describe 'configuration' do
    let(:subject) { Starfighter.config }

    it 'lets you specify your api key' do
      Starfighter.configure do |config|
        config.api_key = 'The Last Starfighter'
      end

      expect(subject.api_key).to eq('The Last Starfighter')
    end

    it 'sets the base_url' do
      expect(subject.base_url).to eq('https://api.stockfighter.io/ob/api')
    end

    it 'creates a client object' do
      expect(subject.client.class).to be(Starfighter::Client)
    end
  end
end
