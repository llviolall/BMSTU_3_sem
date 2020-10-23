# frozen_string_literal: true

def correct_str(str)
  str_arr = str.split
  str_arr.each_index do |i|
    l = str_arr[i].size - 1
    if str_arr[i][l].eql? '#' do
        word = puts.chomp
        str_arr[i] = word
      end
    end
  end
  str_arr.join ' '
end
