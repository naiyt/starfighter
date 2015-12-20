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
  end
end
