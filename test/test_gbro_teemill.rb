# frozen_string_literal: true

require 'minitest/reporters'
Minitest::Reporters.use!

require 'simplecov'
SimpleCov.start do
  add_filter 'test'
end

require 'simplecov-cobertura'
SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter

require 'minitest/autorun'
require "#{File.dirname(__FILE__)}/../lib/gbro_teemill"

class TestTeemill < Minitest::Test
  def test_api_key
    Teemill.api_key = 'bulbasaur'
    assert_equal Teemill.api_key, 'bulbasaur'
  end
end
