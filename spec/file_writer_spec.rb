require 'rspec'
require './lib/file_writer'
require './lib/translator'

RSpec.describe FileWriter do
  before :each do
    @file_writer = FileWriter.new('test.txt', 'spec_output.txt')
  end

  context '#initialize' do
    it 'exists' do
      expect(@file_writer).to be_a FileWriter
    end
  end

  context 'methods' do
    it '#char_count' do
      file = File.open('test.txt', "r")
      expected = @file_writer.character_count(file)

      expect(expected).to be_an Integer
      expect(expected).to eq 8
    end

    it '#lines_arr' do
      expected = @file_writer.lines_arr

      expect(expected).to be_an Array
      expect(expected[0]).to eq '0.0.00..000.00'
    end

    it '#write_file' do
      expect(@file_writer.write_file).to eq nil

      expect(File.file?('./spec_output.txt')).to eq true
    end
  end
end
