require_relative './base/bearer_token_authenticated_resource'

module Teemill
  class CustomProduct < BearerTokenAuthenticatedResource
    def self.create(options)
      self.new.send_post_request(
        '/product/create',
        options
      )
    end
  end
end