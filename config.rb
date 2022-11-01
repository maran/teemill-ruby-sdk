module Teemill
  class Config
    attr_accessor :api_key, :api_base, :api_version, :bearer_token

    def initialize
      @api_version = 1
      @api_base = 'https://api.teemill.com'
    end
  end
end