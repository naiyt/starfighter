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
  end
end
