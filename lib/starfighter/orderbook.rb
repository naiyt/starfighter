module Starfighter
  class OrderBook
    attr_reader :venue, :symbol, :bids, :asks, :timestamp

    def initialize(venue, stock)
      @venue = venue
      @stock = stock

      refresh
    end

    def refresh
      data = Starfighter.config.client.get("venues/#{@venue}/stocks/#{@stock}")
      @bids = data['bids']
      @asks = data['asks']
      @timestamp = data['ts']
    end
  end
end
