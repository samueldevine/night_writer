require 'rspec'
require './lib/braille_translator'

RSpec.describe BrailleTranslator do
  before :each do
    @translator = BrailleTranslator.new('./data/dictionary.csv')
  end

  context '#initialize' do
    it 'exists' do
      expect(@translator).to be_a BrailleTranslator
    end

    it 'generates a dictionary' do
      path = './data/dictionary.csv'

      expect(@translator.generate_dots(path)).to be_an Array
      expect(@translator.generate_dots(path).first).to be_a Dot
      expect(@translator.generate_cells).to be_a Hash
      expect(@translator.generate_cells['a']).to be_an Array
      expect(@translator.generate_cells['a']).to eq ['0', '.', '.', '.', '.', '.',]
    end
  end

  context 'braille to alpha methods' do
    it '#find_cell_by_alpha_char returns a braille cell array' do
      expected = @translator.find_cell_by_alpha_char('a')

      expect(expected).to be_an Array
      expect(expected).to eq ['0', '.', '.', '.', '.', '.',]
    end

    it '#get_alpha_chars' do
      string1 = "..0.\n....\n.0.."
      string2 = "0.0.\n..0.\n...."
      expected1 = @translator.get_alpha_chars(string1)
      expected2 = @translator.get_alpha_chars(string2)

      expect(expected1).to be_an Array
      expect(expected1).to eq ['A']
      expect(expected2).to eq ['a','b']
    end

    it '#translate_to_alpha outputs alphanumeric characters' do
      string1 = "0.\n..\n.."
      string2 = "0.0.00\n..0...\n......"
      expected1 = @translator.translate_to_alpha(string1)
      expected2 = @translator.translate_to_alpha(string2)

      expect(expected1).to be_an Array
      expect(expected1[0]).to eq 'a'
      expect(expected2[0]).to eq 'abc'
    end
  end
end
