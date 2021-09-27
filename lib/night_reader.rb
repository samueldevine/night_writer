# frozen_string_literal: true

# This is the main file for Night Reader. This project translates braille text
# files to plain text, assuming a 0 represents an empty space and a . represents
# a raised dot in each cell.

require './lib/translator'
require './lib/file_writer'

file_writer = FileWriter.new(ARGV[0], ARGV[1])
file_writer.write_alpha_file
