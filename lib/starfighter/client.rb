require 'faraday'

module Starfighter
  class Client
    def initialize(config)
      @connection = Faraday.new(url: config.base_url) do |f|
        f.request   :url_encoded
        f.response  :logger
        f.adapter   Faraday.default_adapter
      end
    end
  end
end
