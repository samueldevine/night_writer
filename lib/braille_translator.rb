# frozen_string_literal: true

# The BrailleTranslator class creates a dictionary using the included .csv file
# and uses it to translate messages from braille to alphanumeric characters

require 'csv'
require './lib/readable_csv'
require './lib/dot'

class BrailleTranslator
  include ReadableCSV

  def initialize(path)
    @path = path
  end

  def generate_dots(path)
    read_csv(path).map do |row|
      Dot.new(row)
    end
  end

  def find_cell_by_alpha_char(char)
    dots ||= generate_dots(@path)

    dots.map do |dot|
      dot.data[char]
    end
  end

  def generate_cells
    cells = {}

    ('a'..'z').each do |letter|
      cells[letter] = find_cell_by_alpha_char(letter)
    end

    cells[' '] = find_cell_by_alpha_char(' ')
    cells
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

    cells ||= generate_cells
    caps = false

    chars.values.map do |dots|
      if dots == ['.', '.', '.', '.', '.', '0']
        caps = true
        next
      elsif caps == true
        caps = false
        cells.key(dots).upcase
      else
        cells.key(dots)
      end
    end.compact
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
