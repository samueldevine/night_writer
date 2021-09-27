# frozen_string_literal: true

# The Translator class creates a dictionary using the included .csv file and
# uses it to translate messages to and from braille

require 'csv'
require './lib/readable_csv'
require './lib/dot'

class AlphaTranslator
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

  def get_braille_chars(string)
    chars = string.chars

    chars.map do |char|
      cell = find_cell_by_alpha_char(char.downcase)

      if char.ord.between?(65, 90)
        flag = ['.', '.', '.', '.', '.', '0']
        [flag, cell]
      else
        cell
      end
    end
  end

  def translate_to_braille(string)
    chars = get_braille_chars(string)
    lines = []

    until chars.length <= 0
      output_array = chars[0..39]

      line1 = output_array.map do |char|
        if char[0].class == Array
          "#{char[0][0]}" + "#{char[0][3]}" + "#{char[1][0]}" + "#{char[1][3]}"
        else
          "#{char[0]}" + "#{char[3]}"
        end
      end.join('')

      line2 = output_array.map do |char|
        if char[0].class == Array
          "#{char[0][1]}" + "#{char[0][4]}" + "#{char[1][1]}" + "#{char[1][4]}"
        else
          "#{char[1]}" + "#{char[4]}"
        end
      end.join('')

      line3 = output_array.map do |char|
        if char[0].class == Array
          "#{char[0][2]}" + "#{char[0][5]}" + "#{char[1][2]}" + "#{char[1][5]}"
        else
          "#{char[2]}" + "#{char[5]}"
        end
      end.join('')

      lines << line1
      lines << line2
      lines << line3

      chars.slice!(0..39)
    end
    lines
  end
end
