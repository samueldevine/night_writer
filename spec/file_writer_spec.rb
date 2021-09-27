require 'rspec'
require './lib/file_writer'

RSpec.describe FileWriter do
  context '#initialize' do
    before :each do
      @file_writer = FileWriter.new('test.txt', 'spec_output.txt')
    end

    it 'exists' do
      expect(@file_writer).to be_a FileWriter
    end
  end

  context 'alpha to braille methods' do
    before :each do
      @file_writer = FileWriter.new('test.txt', 'spec_output.txt')
    end

    it '#character_count' do
      file = File.open('test.txt', "r")
      expected = @file_writer.character_count(file)

      expect(expected).to be_an Integer
      expect(expected).to eq 7
    end

    it '#braille_lines' do
      expected = @file_writer.braille_lines

      expect(expected).to be_an Array
      expect(expected[0]).to eq '0.0.00..000.00'
    end

    it '#write_braille_file' do
      expect(@file_writer.write_braille_file).to eq nil

      expect(File.file?('./spec_output.txt')).to eq true
    end
  end

  context 'braille to alpha methods' do
    before :each do
      @file_writer = FileWriter.new('spec_output.txt', 'test2.txt')
    end

    it '#alpha_lines' do
      expected = @file_writer.alpha_lines

      expect(expected).to be_an Array
      expect(expected[0]).to eq 'abc def'
    end

    it '#write_alpha_file' do
      expect(@file_writer.write_alpha_file).to eq nil

      expect(File.file?('./test.txt')).to eq true
    end
  end
end
