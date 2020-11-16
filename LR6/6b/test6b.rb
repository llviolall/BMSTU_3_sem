# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/assertions'
require_relative 'labs6b'

# class for test
class MyTest < Minitest::Test
  def test_first
    result = answer(0.1)
    assert_in_delta(0.5, result, 0.1)
  end

  def test_second
    result = answer(0.0001)
    assert_in_delta(0.5, result, 0.0001)
  end
end