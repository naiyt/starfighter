module Starfighter
  class Venue
    def initialize(venue_symbol)
      @venue_symbol = venue_symbol
      @client = Starfighter.config.client
      @orderbooks = {}
    end

    # Check to see if the venu is available
    def up?
      @client.get("venues/#{@venue_symbol}/heartbeat")['ok'] rescue false
    end

    # TODO: add exceptions (e.g., can't find venue)
    def stocks(refresh = false)
      @stocks = nil if refresh
      @stocks ||= begin
        @client.get("venues/#{@venue_symbol}/stocks")['symbols'] rescue nil
      end
    end

    def orderbook(stock)
      return @orderbooks[stock] if @orderbooks.has_key?(stock)
      @orderbooks[stock] = OrderBook.new(@venue_symbol, stock)
    end
  end
end
