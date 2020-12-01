# frozen_string_literal: true

require_relative 'labs7a'
puts '1 - отрезок, первое число 1, а остальные 4 задают концы отрезка'
puts '2 - окружность, первое число 2, а остальные 3 задают центр и радиус'
a = gets.chomp.to_f
while a == 1 || a == 2
  if a == 1
    puts 'Введите 5 значений для отрезка через запятую или пробел'
    str_segment = gets.chomp
    str_segment = 'Данные были введены неправильно' if str_segment[0] != '1'
    func_file(func_mod(str_segment))
    puts 'Введите 1 - для записи отрезка, 2 - для записи окружности, 0 - для выхода'
    a = gets.chomp.to_f
  else
    puts 'Введите 4 значений для отрезка через запятую или пробел'
    str_circle = gets.chomp
    str_circle = 'Данные были введены неправильно' if str_circle[0] != '2'
    func_file(func_mod(str_circle))
    puts 'Введите 1 - для записи отрезка, 2 - для записи окружности, 0 - для выхода'
    a = gets.chomp.to_f
  end
end
puts 'Содержимое файла'
if File.exist?(File.join(Dir.home, 'out.txt'))
  func_file_puts
else
  puts 'Файл отсутствует'
end