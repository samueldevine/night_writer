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

  def translate(string)
    chars = string.chars

    chars.map do |char|
      @cells.map do |dot|
        dot.data[char]
      end
    end
  end
end
