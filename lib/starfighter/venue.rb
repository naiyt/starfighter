module Starfighter
  class Venue
    def initialize(symbol)
      @symbol = symbol
      @client = Starfighter.config.client
    end

    # Check to see if the venu is available
    def up?
      @client.get("venues/#{@symbol}/heartbeat")['ok'] rescue false
    end

    # TODO: add exceptions (e.g., can't find venue)
    def stocks(refresh = false)
      @stocks = nil if refresh
      @stocks ||= begin
        @client.get("venues/#{@symbol}/stocks")['symbols'] rescue nil
      end
    end
  end
end
