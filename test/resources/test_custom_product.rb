# frozen_string_literal: true

require 'minitest/reporters'
Minitest::Reporters.use!

require 'minitest/autorun'

class TestCustomProduct < Minitest::Test
  def test_update
    assert_raises(Teemill::InvalidRequestError) { Teemill::CustomProduct.update(1, {}) }
  end

  def test_create_with_no_api_key
    assert_raises(Teemill::MissingLegacyCredentialsError) { Teemill::CustomProduct.create({}) }
  end

  def test_authenticates_with_bearer_token
    Teemill.legacy_api_key = 'charmander'

    custom_product = Teemill::CustomProduct.new
    headers = custom_product.authenticated_request_headers

    assert_match headers[:Authorization], 'Bearer charmander'
    Teemill.legacy_api_key = nil
  end
end
