# frozen_string_literal: true

require 'colorize'

module Teemill
  class MissingLegacyCredentialsError < Teemill::MissingCredentialsError
    def message
      'No legacy API key has been provided'
    end

    def docs_hash_mark
      '#legacy_authentication'
    end
  end
end
