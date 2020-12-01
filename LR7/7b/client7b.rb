require_relative 'labs7b'

puts '***Прямоугольник***'
puts 'Введите размеры (высота, ширина):'
hh = gets.chomp
ww = gets.chomp
rec = Rectangle.new(hh.to_f, ww.to_f)
rec.print
rec.square

puts '***Прямоугольный параллелепипед***'
puts 'Введите размеры (высота, ширина, глубина):'
hh = gets.chomp
ww = gets.chomp
dd = gets.chomp
par = Parallelepiped.new(hh.to_f, ww.to_f, dd.to_f)
par.print
par.volume