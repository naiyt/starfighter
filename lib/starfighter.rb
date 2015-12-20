require 'starfighter/version'
require 'starfighter/config'

module Starfighter
  def self.configure
    yield config
  end

  def self.config
    @config ||= Config.new
  end

  def self.reset
    @config = Config.new
  end
end
