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
    @cells = generate(path) # => array of Lines
  end

  def generate(path)
    read_csv(path).map do |row|
      Dot.new(row) # => hash containing letters (keys) and raised dots (values)
    end
  end

  def translate(string)
    chars = string.chars # => ['a', 'b', 'c']

    chars.map do |char|
      @cells.map do |dot|
        dot.data[char]
      end # => for a: ['.', '0', '0', '0', '0', '0',]
    end # => [[a cell data], [b cell data], [c cell data]]
  end
end
