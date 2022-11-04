
require_relative './errors/errors'
require_relative './resources/request/requests'
require_relative './resources/resources'
require_relative './config'
require 'forwardable'

module Teemill
  @config = Config.new

  class << self
    extend Forwardable

    attr_reader :config

    def_delegators :@config, :api_key, :api_key=
    def_delegators :@config, :bearer_token, :bearer_token=
    def_delegators :@config, :api_version, :api_version=
    def_delegators :@config, :api_base, :api_base=
  end
end
