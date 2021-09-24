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
output_array = translator.translate(input_string)

File.open(ARGV[1], "w") { |file| file.puts "#{output_array[0][0]}" }
File.open(ARGV[1], "a") { |file| file.puts "#{output_array[0][1]}" }
File.open(ARGV[1], "a") { |file| file.puts "#{output_array[0][2]}" }

puts "Created '#{ARGV[1]}' containing #{char_count} characters."
