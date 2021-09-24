# frozen_string_literal: true

# The Translator class creates a dictionary using the included .csv file and
# uses it to translate messages into braille

require 'csv'
require './lib/readable_csv'
require './lib/line'

class Translator
  include ReadableCSV

  attr_reader :dictionary

  def initialize(path)
    @dictionary = generate(path) # => array of Lines
  end

  def generate(path)
    read_csv(path).map do |row|
      Line.new(row) # => hash containing letters (keys) and raised dots (values)
    end
  end

  def translate(string)
    chars = string.chars

    chars.map do |char|
      @dictionary.map do |line|
        line.letters[char]
      end
    end
  end
end
