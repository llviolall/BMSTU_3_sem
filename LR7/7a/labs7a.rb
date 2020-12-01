# frozen_string_literal: true

def func_file(str)
  if File.exist?('out.txt')
    File.open('out.txt', 'a') do |file_F|
      file_F.puts str
    end
  else
    file_F = File.new('out.txt', 'a')
    file_F.puts str
    file_F.close
  end
end

def func_file_puts
  file_F = File.open('out.txt', 'r')
  while (str = file_F.gets)
    puts str
  end
  file_F.close
end

def func_mod(str)
  count = 0
  count = str.scan(',').size
  str = if count.zero?
          str.split.find_all { |elem| elem != ' '}.join(' ')
        else
          str.split.find_all { |elem| elem != ' '}.join
        end
  if str.match(/[a-z][а-я]]/)
    str = 'Неправильный ввод. Найдены буквы'
  elsif str[0] == '1' && str.length != 17
    str = 'Неправильный ввод.'
  elsif str[0] == '2' && str.length != 13
    str = 'Неправильный ввод.'
  end
  str
end