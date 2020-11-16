# frozen_string_literal: true

require_relative 'labs5b'

array = Array[]
puts 'Введите слово-заменитель'
key = gets.chomp
puts 'Введите строку'
str = gets.chomp
array = str.split

puts "\n \tИзначальные строки: "
puts str
puts "\n \tОтформатированные строки: "
(0..array.length - 1).each do |i|
  print "#{correct_str(array[i], key)} "
end