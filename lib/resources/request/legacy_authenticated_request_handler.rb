module Teemill
  module LegacyAuthenticatedRequestHandler
    include Teemill::AuthenticatedRequestHandler
    def authenticated_request_headers
      { Authorization: "Bearer #{Teemill.legacy_api_key}" }
    end

    def base_url
      "#{Teemill.legacy_api_base}/omnis/v3"
    end

    private
    
    def check_credentials
      raise Teemill::MissingLegacyCredentialsError unless Teemill.legacy_api_key
    end
  end
end