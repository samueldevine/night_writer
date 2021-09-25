# frozen_string_literal: true

# The Translator class creates a dictionary using the included .csv file and
# uses it to translate messages into braille

require 'csv'
require './lib/readable_csv'
require './lib/dot'

class Translator
  include ReadableCSV

  attr_reader :cells

  def initialize(path)
    @cells = generate(path)
  end

  def generate(path)
    read_csv(path).map do |row|
      Dot.new(row)
    end
  end

  def get_braille_chars(string)
    chars = string.chars

    chars.map do |char|
      @cells.map do |dot|
        dot.data[char]
      end
    end
  end

  def translate_to_braille(string)
    chars = get_braille_chars(string)
    lines = []

    until chars.length <= 0
      output_array = chars[0..39] # => [array of [arrays for each char]]

      line1 = output_array.map do |char|
        "#{char[0]}" + "#{char[3]}"
      end.join('')

      line2 = output_array.map do |char|
        "#{char[1]}" + "#{char[4]}"
      end.join('')

      line3 = output_array.map do |char|
        "#{char[2]}" + "#{char[5]}"
      end.join('')

      lines << line1
      lines << line2
      lines << line3

      chars.slice!(0..39)
    end
    lines
  end
end
