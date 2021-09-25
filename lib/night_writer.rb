# frozen_string_literal: true

# This is the main file for Night Writer! This project translates plain text
# files to braile, using 0 to represent empty spaces and . to represent raised
# dots in each block.

require './lib/translator'
require './lib/file_writer'

file_writer = FileWriter.new(ARGV[0], ARGV[1])
file_writer.write_file
