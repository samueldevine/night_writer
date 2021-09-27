require 'rspec'
require './lib/alpha_translator'

RSpec.describe AlphaTranslator do
  before :each do
    @translator = AlphaTranslator.new('./data/dictionary.csv')
  end

  context '#initialize' do
    it 'exists' do
      expect(@translator).to be_an AlphaTranslator
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

  context 'alpha to braille methods' do
    it '#get_braille_chars' do
      string1 = 'a'
      string2 = 'AB'
      expected1 = @translator.get_braille_chars(string1)
      expected2 = @translator.get_braille_chars(string2)

      expect(expected1).to be_an Array
      expect(expected1[0]).to be_an Array
      expect(expected1[0]).to eq ['0', '.', '.', '.', '.', '.']
      expect(expected2[0][0]).to eq ['.', '.', '.', '.', '.', '0']
      expect(expected2[0][1]).to eq ['0', '.', '.', '.', '.', '.']
    end

    it '#translate_to_braille outputs an array of braille strings' do
      braille_a = @translator.translate_to_braille('a')

      expect(braille_a).to be_an Array
      expect(braille_a[0].length).to eq 2
      expect(braille_a[0]).to eq '0.'
    end

    it '#translate_to_braille can translate multiple chars' do
      braille_abc = @translator.translate_to_braille('abc')

      expect(braille_abc).to be_an Array
      expect(braille_abc.length).to eq 3
      expect(braille_abc[0][0]).to eq '0'
      expect(braille_abc[1][0]).to eq '.'
      expect(braille_abc[2][0]).to eq '.'
    end
  end
end
