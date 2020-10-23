# frozen_string_literal: true
#test
# 
require_relative 'labs5b'

strclient.each do |line|
  puts correct_str(line.chomp)
end