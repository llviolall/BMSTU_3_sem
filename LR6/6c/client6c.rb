# frozen_string_literal: true

require_relative 'labs6c'

puts 'block or lambda'
case gets.chomp
when 'block'
  puts 'sin or tg'
  case gets.chomp
  when 'sin'
    Differ.new.differ_with_block do |x|
      Math.sin(x)
    end
  when 'tg'
    Differ.new.differ_with_block do |x|
      Math.tan(x)
    end
  else
    p 'invalid input'
  end

when 'lambda'
  puts 'sin or tg'
  case gets.chomp
  when 'sin'
    Differ.new.differ_with_lambda(->(x) { Math.sin(x) })
  when 'tg'
    Differ.new.differ_with_lambda(->(x) { Math.tan(x) })
  else
    p 'invalid input'
  end

else
  p 'invalid input'
end
