# frozen_string_literal: true

# :reek:UtilityFunction
require 'minitest/autorun'
require 'minitest/assertions'
require_relative 'labs5b'

# test class
class MyTest < Minitest::Test
  ALPHABET = ('a'..'z').to_a

  def setup
    arr_init = []
    arr_rez = []
    rand(5..10).times do
      # sample - choose 10 random elements from the array
      # join - returns a string by conventing each element of the array to a string
      word = ALPHABET.sample(10).join
      case rand(0..1)
      when 0
        arr_init << "##{word}#"
        arr_rez << 'key'
      else
        arr_init << word
        arr_rez << word
      end
    end
    @str = arr_init.join(' ')
    @rez = arr_rez.join(' ')
  end

  def test_first
    assert_equal(@rez, correct_str(@str, 'key'))
  end

  def test_second
    assert_equal(@rez, correct_str(@str, 'key'))
  end
end
