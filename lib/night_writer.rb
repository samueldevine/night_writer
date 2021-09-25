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
File.open(ARGV[1], "w") { |file| file.puts "" }

until input_string.length <= 0
  output_array = translator.translate(input_string[0..39]) # => [array of [arrays for each char]]

  line1 = output_array.map do |char_array|
    "#{char_array[0]}" + "#{char_array[3]}"
  end.join('')

  line2 = output_array.map do |char_array|
    "#{char_array[1]}" + "#{char_array[4]}"
  end.join('')

  line3 = output_array.map do |char_array|
    "#{char_array[2]}" + "#{char_array[5]}"
  end.join('')

  File.open(ARGV[1], "a") { |file| file.puts "#{line1}" }
  File.open(ARGV[1], "a") { |file| file.puts "#{line2}" }
  File.open(ARGV[1], "a") { |file| file.puts "#{line3}" }

  input_string.slice!(0..39)
end

puts "Created '#{ARGV[1]}' containing #{char_count} characters."
