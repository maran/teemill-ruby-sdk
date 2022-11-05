
require_relative './errors/errors'
require_relative './resources/request/requests'
require_relative './resources/resources'
require_relative './config'
require_relative './debug'
require 'forwardable'

module Teemill
  @config = Config.new
  @debug = Debug.new

  class << self
    extend Forwardable

    attr_reader :config

    def_delegators :@config, :api_key, :api_key=
    def_delegators :@config, :legacy_api_key, :legacy_api_key=
    def_delegators :@config, :api_version, :api_version=
    def_delegators :@config, :api_base, :api_base=
    def_delegators :@config, :legacy_api_base, :legacy_api_base=
    def_delegators :@debug, :debug_mode, :debug_mode=
  end
end
