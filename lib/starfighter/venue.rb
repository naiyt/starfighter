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

    def make_order(stock, price, qty, direction, order_type)
      params = {
        account: Starfighter.config.account,
        venue: @venue_symbol,
        stock: stock,
        price: price,
        qty: qty,
        direction: direction,
        orderType: order_type,
      }

      # TODO - some actual parsing on the response here
      @client.post("venues/#{@venue_symbol}/stocks/#{stock}/orders", params.to_json)
    end
  end
end
