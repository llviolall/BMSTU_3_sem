# frozen_string_literal: true

require_relative 'labs7a'
require 'minitest/autorun'

class TestFile < MiniTest::Unit::TestCase
  def setup
    @etalon_1 = func_mod('1 2.0 4.5 4.0 3.0')
    @etalon_2 = func_mod('2,3.4,4.0,2.2')
  end

  def test_file
    file_G = File.new('test.txt', 'w')
    file_F = File.open('out.txt', 'r')
    while (line = file_F.gets)
      file_G.puts line
    end
    file_F.close
    file_G.close
    file_F = File.open('out.txt', 'a')
    file_F.puts @etalon_1
    file_F.puts @etalon_2
    file_G = File.open('test.txt', 'a')
    file_G.puts '1 2.0 4.5 4.0 3.0'
    file_G.puts '2,3.4,4.0,2.2'
    file_F.close
    file_G.close
    arr1 = []
    arr2 = []
    expected = File.open('out.txt', 'r')
    while (line = expected.gets)
      arr1.push(line)
    end
    actual = File.open('test.txt', 'r')
    while (line = actual.gets)
      arr2.push(line)
    end
    assert_equal(arr1, arr2)
  end
end
