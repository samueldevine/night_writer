# frozen_string_literal: true

# This is the main file for Night Writer! This project translates plain text
# files to braile, using 0 to represent empty spaces and . to represent raised
# dots in each block.

char_count = File.open(ARGV[0]).sum do |line|
  line.chars.count
end

puts "Created '#{ARGV[1]}' containing #{char_count} characters."
