# frozen_string_literal: true

require 'minitest/reporters'
require 'spy'
require 'uri'
Minitest::Reporters.use!

require 'minitest/autorun'

class TestBaseResource < Minitest::Test
  def test_send_post_request_routes_to_send_request
    base_resource = Teemill::BaseResource.new
    spy = Spy.on(base_resource, :send_request).and_return({ id: 1 })

    base_resource.send_post_request('test', {})

    assert_equal true, spy.has_been_called_with?('test', {}, 'POST')
  end

  def test_send_get_request_routes_to_send_request
    base_resource = Teemill::BaseResource.new
    spy = Spy.on(base_resource, :send_request).and_return({ id: 1 })

    base_resource.send_get_request('test', {})

    assert_equal true, spy.has_been_called_with?('test', {}, 'GET')
  end

  def test_create_with_no_api_key
    assert_raises(Teemill::MissingLegacyCredentialsError) { Teemill::CustomProduct.create({}) }
  end

  def test_base_resource_uses_the_root_api_base
    Teemill.api_base = 'https://example.com'

    assert_equal 'example.com', URI(Teemill::BaseResource.new.base_url).host
  end

  def test_authenticates_with_authorization_header
    Teemill.api_key = 'squirtle'

    custom_product = Teemill::BaseResource.new
    headers = custom_product.authenticated_request_headers

    assert_match headers[:Authorization], 'squirtle'
    Teemill.api_key = nil
  end
end
