require_relative './request_handler'

module BearerTokenAuthenticatedRequestHandler
  include RequestHandler
  def authenticated_request_headers
    { Authorization: "Bearer #{Teemill.bearer_token}" }
  end

  def base_url
    "#{Teemill.api_base}/omnis/v3"
  end
end