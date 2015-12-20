require 'starfighter/version'
require 'starfighter/config'
require 'starfighter/client'
require 'starfighter/venue'
require 'starfighter/orderbook'
require 'pry'

module Starfighter
  def self.configure
    yield config
    config.client = Starfighter::Client.new(config)
  end

  def self.config
    @config ||= Config.new
  end

  def self.reset
    @config = Config.new
  end

  # Checks to see if the Starfighter API is available
  def self.up?
    config.client.get('heartbeat')['ok'] rescue false
  end
end
