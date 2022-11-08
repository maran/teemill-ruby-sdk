# frozen_string_literal: true

module Teemill
  class Config
    attr_accessor :api_key,
                  :api_base,
                  :api_version,
                  :legacy_api_key,
                  :legacy_api_base

    def initialize
      @api_version = 1
      @api_base = 'https://api.teemill.com'
      @legacy_api_base = 'https://teemill.com'
    end
  end
end
