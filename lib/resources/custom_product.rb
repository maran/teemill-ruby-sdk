require_relative './request/bearer_token_authenticated_request_handler'
require_relative './base_resource'

module Teemill
  class CustomProduct < BaseResource
    include BearerTokenAuthenticatedRequestHandler

    attr_accessor :id, :url, :image, :colours, :name, :price

    def self.create(options)
      obj = new

      response = obj.send_post_request(
        '/product/create',
        options
      )

      obj.assign_properties(response)

      obj
    end
  end
end