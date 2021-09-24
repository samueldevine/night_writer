# frozen_string_literal: true

# This is the main file for Night Writer! This project translates plain text
# files to braile, using 0 to represent empty spaces and . to represent raised
# dots in each block.

require './lib/translator'

input_file = File.open(ARGV[0], "r")
input_string = File.open(ARGV[0], "r") { |file| file.read }

char_count = input_file.sum do |line|
  line.chars.count
end

translator = Translator.new('./data/dictionary.csv')
output_array = translator.translate(input_string) # => [array of [arrays for each char]]

line1 = output_array.map do |char_array|
  "#{char_array[0]}" + "#{char_array[3]}" # => ['.0', '.0', '..']
end.join('')

line2 = output_array.map do |char_array|
  "#{char_array[1]}" + "#{char_array[4]}" # => ['00', '.0', '00']
end.join('')

line3 = output_array.map do |char_array|
  "#{char_array[2]}" + "#{char_array[5]}" # => ['00', '00', '00']
end.join('')

File.open(ARGV[1], "w") { |file| file.puts "#{line1}" }
File.open(ARGV[1], "a") { |file| file.puts "#{line2}" }
File.open(ARGV[1], "a") { |file| file.puts "#{line3}" }

puts "Created '#{ARGV[1]}' containing #{char_count} characters."
