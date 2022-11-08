# frozen_string_literal: true

require 'colorize'

module Teemill
  class Debug
    attr_accessor :debug_mode

    def self.log(string, color)
      return unless Teemill.debug_mode

      warn string.public_send(color)
    end
  end
end
