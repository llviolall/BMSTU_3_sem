# frozen_string_literal: true

require_relative 'labs5a'
require 'minitest/autorun'

# test class
class TestMath < Minitest::Test
  # runs before every test. Use this to set up before each test
  def setup; end

  def test_calc_func
    # check the statement for equality
    assert_equal(-6.0, MathFunc.new.func(-3, 0))
    assert_equal(4.80252875, MathFunc.new.func(5, -6))
  end

  # runs after every test. Use this to clean up after each test
  def teardown; end
end