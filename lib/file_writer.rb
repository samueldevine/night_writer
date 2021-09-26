class FileWriter

  def initialize(input_file, output_file)
    @input_file   = File.open(input_file, "r")
    @input_string = File.read(input_file).downcase
    @translator   = Translator.new('./data/dictionary.csv')
    @output_file  = output_file
  end

  def alpha_character_count(file)
    file.sum do |line|
      line.chars.count
    end
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
end
