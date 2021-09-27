# frozen_string_literal: true

# The FileWriter class takes inputs: a file to be translated and a filepath for
# the translation to be written to. The class is responsible for passing the
# input file to Translator, getting a translation back, and writing it to the
# intended output_file. It also counts the number of characters to provide a
# confirmation message after it's done.

class FileWriter

  def initialize(input_file, output_file)
    @input_file   = File.open(input_file, "r")
    @input_string = File.read(input_file)
    @translator   = Translator.new('./data/dictionary.csv')
    @output_file  = output_file
  end

  def alpha_character_count(file)
    file.sum do |line|
      line.chars.count
    end - 1
    # don't count final "\n" character
  end

  def braille_lines
    @translator.translate_to_braille(@input_string)
  end

  def write_braille_file
    File.open(@output_file, "w") {}
    # overwrites any data that may already be in the file

    (braille_lines.length).times do |i|
      File.open(@output_file, "a") { |file| file.puts "#{braille_lines[i]}" }
    end

    char_count = alpha_character_count(@input_file)
    puts "Created '#{@output_file}' containing #{char_count} characters."
  end

  def braille_character_count(file)
    file.sum do |line|
      ((line.chars.count - 1.0) / 6)
    end.to_i
  end

  def alpha_lines
    @translator.translate_to_alpha(@input_string)
  end

  def write_alpha_file
    File.open(@output_file, "w") {}

    (alpha_lines.length).times do |i|
      File.open(@output_file, "a") { |file| file.puts "#{alpha_lines[i]}" }
    end

    char_count = braille_character_count(@input_file)
    puts "Created '#{@output_file}' containing #{char_count} characters."
  end
end
