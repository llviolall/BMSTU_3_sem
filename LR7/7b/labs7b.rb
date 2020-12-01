class Rectangle
  attr_accessor :h, :w

  def initialize (h, w)
    @h = h
    @w = w
  end

  def print
    puts "Высота: #{@h}\nШирина: #{@w}"
  end

  def square
    puts "Площадь прямоугольника: #{h * w}"
    h * w
  end
end

class Parallelepiped < Rectangle
  attr_accessor :d

  def initialize(h, w, d)
    super(h, w)
    @d = d
  end

  def print
    super
    puts "Глубина d: #{@d}"
  end

  def volume
    puts "Объём прямоугольного параллелепипеда: #{h * w * d}"
    h * w * d
  end
end