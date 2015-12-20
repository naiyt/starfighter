require 'faraday'
require 'json'

module Starfighter
  class Client
    def initialize(config)
      @config = config

      @connection = Faraday.new(url: config.base_url) do |f|
        f.request   :url_encoded
        # f.response  :logger
        f.adapter   Faraday.default_adapter
      end
    end

    def post(endpoint, body = {})
      response = @connection.post do |req|
        req.url url(endpoint)
        req.headers['Content-Type'] = 'application/json'
        req.headers['X-Starfighter-Authorization'] = @config.api_key
        req.body = body
      end

      parse(response)
    end

    def get(endpoint, params = {})
      response = @connection.get do |req|
        req.url url(endpoint), params
      end

      parse(response)
    end

    private

    def url(endpoint)
      "/ob/api/#{endpoint}"
    end

    def parse(response)
      JSON.parse(response.body)
    end
  end
end
