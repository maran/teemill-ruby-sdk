module Teemill
  module BearerTokenAuthenticatedRequestHandler
    include Teemill::RequestHandler
    def authenticated_request_headers
      { Authorization: "Bearer #{Teemill.bearer_token}" }
    end

    def base_url
      "#{Teemill.api_base}/omnis/v3"
    end
  end
end