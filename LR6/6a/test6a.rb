# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/assertions'
require_relative 'labs6a'

# class for test
class MyTest < Minitest::Test
  def test_first
    result = find_series(0.1)
    assert_in_delta(0.5, result[0], 0.1)
    assert_equal(4, result[1])
  end

  def test_second
    result = find_series(1e-4)
    assert_in_delta(0.5, result[0], 1e-4)
  end
end
