# require_relative './request/bearer_token_authenticated_request_handler'


module Teemill
  class CustomProduct < Teemill::BaseResource
    include Teemill::BearerTokenAuthenticatedRequestHandler

    attr_accessor :id, :url, :image, :colours, :name, :price

    def create_resource_url
      '/product/create'
    end
  end
end