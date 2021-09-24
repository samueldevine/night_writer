# frozen_string_literal: true

# The Translator class creates a dictionary using the included .csv file and
# uses it to translate messages into braille

require 'csv'

class Translator
  def initialize(path)
    @dictionary = generate(path)
  end

  def generate(path)
    read_csv(path).map do |row|
      # need to create read_csv module
      # need to read columns, not rows
      Letter.new(row)
    end
  end

  def lookup(letter)
  end
end
