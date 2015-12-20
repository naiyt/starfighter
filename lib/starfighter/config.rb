module Starfighter
  class Config
    attr_accessor :api_key, :client
    attr_reader :base_url

    def initialize
      @base_url = 'https://api.stockfighter.io/ob/api'
    end
  end
end
