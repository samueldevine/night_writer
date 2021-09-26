# frozen_string_literal: true

# The Translator class creates a dictionary using the included .csv file and
# uses it to translate messages into braille

require 'csv'
require './lib/readable_csv'
require './lib/dot'

class Translator
  include ReadableCSV

  attr_reader :dots,
              :cells

  def initialize(path)
    @dots   = generate_dots(path)
    @cells  = generate_cells
  end

  def generate_dots(path)
    read_csv(path).map do |row|
      Dot.new(row)
    end
  end

  def generate_cells
    @cells = {}
    ('a'..'z').each do |letter|
      @cells[letter] = find_cell_by_alpha_char(letter)
    end
    @cells[' '] = find_cell_by_alpha_char(' ')
    @cells
  end

  def find_cell_by_alpha_char(char)
    @dots.map do |dot|
      dot.data[char]
    end
  end

  def find_alpha_char_by_cell(cell)
    @dots.map do |dot|
      dot.data[char]
    end
  end

  def get_braille_chars(string)
    chars = string.chars

    chars.map do |char|
      @dots.map do |dot|
        dot.data[char]
      end
    end
  end

  def get_alpha_chars(string)
    lines = string.split("\n")
    char_lines = lines.map do |line|
      line.chars
    end

    chars = {}
    i = 0

    (lines.length / 3).times do
      until char_lines[0].length == 0
        chars[i] = [char_lines[0][0], char_lines[1][0], char_lines[2][0], char_lines[0][1], char_lines[1][1], char_lines[2][1]]
        2.times { char_lines[0].shift }
        2.times { char_lines[1].shift }
        2.times { char_lines[2].shift }
        i += 1
      end

      3.times { char_lines.shift }
    end

    chars.values.map do |dots|
      @cells.key(dots)
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

  def translate_to_alpha(string)
    chars = get_alpha_chars(string)
    lines = []

    until chars.length <= 0
      line = chars[0..79].join('')
      lines << line
      chars.slice!(0..79)
    end
    lines
  end
end
