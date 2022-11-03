require_relative './request/request_handler'
require 'ostruct'

class BaseResource
  include RequestHandler

  def assign_properties(props)
    props.each_key do |key|
      value = props[key]

      value = OpenStruct.new(value) if value.instance_of?(Hash)

      send("#{key}=", value)
    end
  end
end
