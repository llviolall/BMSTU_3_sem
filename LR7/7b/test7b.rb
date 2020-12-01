require_relative 'labs7b'
require 'minitest/autorun'

class TestClass < MiniTest::Unit::TestCase
  def setup
    @test_h = rand(1..10)
    @test_w = rand(1..10)
    @test_d = rand(1..10)
    @rect = Rectangle.new(@test_h, @test_w)
    @parall = Parallelepiped.new(@test_h, @test_w, @test_d)
  end

  def test_sq_rectangle
    assert_equal(@rect.square, (@test_h * @test_w))
  end

  def test_sq_parallelepiped
    assert_equal(@parall.volume, (@test_h * @test_w * @test_d))
  end

  def test_hierarchy
    assert_kind_of Rectangle, @parall
  end
end