# frozen_string_literal: true

require 'colorize'

module Teemill
  class DocumentedError < StandardError
    def initialize
      warn message.red
      warn "See: #{docs_reference}".yellow
      super(message)
    end

    def message
      'Unknown error occurred'
    end

    def docs_reference
      "#{docs_domain}#{docs_path}#{docs_query_params}#{docs_hash_mark}"
    end

    def docs_domain
      'https://teemill.com'
    end

    def docs_path
      '/api-docs'
    end

    def docs_query_params
      '?lang=ruby'
    end

    def docs_hash_mark
      '#'
    end
  end
end
