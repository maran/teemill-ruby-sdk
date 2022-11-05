require 'colorize'

module Teemill
  class MissingCredentialsError < Teemill::DocumentedError
    def message
      "No API key has been provided"
    end

    def docs_hash_mark
      "#authentication"
    end
  end
end