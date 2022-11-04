require 'ostruct'

module Teemill
  class BaseResource
    include Teemill::RequestHandler

    def self.create(options)
      obj = new

      raise Teemill::InvalidRequestError, 'No create request exists for this resource' unless obj.create_resource_url

      response = obj.send_post_request(
        obj.create_resource_url,
        options
      )

      obj.assign_properties(response)

      obj
    end

    def assign_properties(props)
      props.each_key do |key|
        value = props[key]

        value = OpenStruct.new(value) if value.instance_of?(Hash)

        send("#{key}=", value)
      end
    end
  end
end