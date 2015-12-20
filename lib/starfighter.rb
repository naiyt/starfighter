require 'starfighter/version'
require 'starfighter/config'
require 'starfighter/client'

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
end
