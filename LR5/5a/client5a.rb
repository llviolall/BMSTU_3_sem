# frozen_string_literal: true

require_relative 'labs5a'

# program for user interaction through the console
class Client
  puts 'enter x'
  arg_x = begin
    Integer(gets.chomp)
  rescue StandardError
    nil
  end
  abort 'NaN' unless arg_x.is_a? Numeric
  arg_x = arg_x.to_i
  puts 'enter z'
  arg_z = begin
    Integer(gets.chomp)
  rescue StandardError
    nil
  end
  abort 'NaN' unless arg_z.is_a? Numeric
  arg_z = arg_z.to_i
  math = MathFunc.new
  arg_a = math.func(arg_x, arg_z)
  puts 'Result of x*(cos(z)+e^(-(x+3))): ', arg_a
end
