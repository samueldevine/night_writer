# frozen_string_literal: true

# This is the main file for Night Writer! This project translates plain text
# files to braile, using 0 to represent empty spaces and . to represent raised
# dots in each block.

input_file = File.open(ARGV[0], "r")
input_string = File.open(ARGV[0], "r") { |file| file.read }

char_count = input_file.sum do |line|
  line.chars.count
end

File.open(ARGV[1], "w") { |file| file.puts "#{input_string}" }

puts "Created '#{ARGV[1]}' containing #{char_count} characters."
