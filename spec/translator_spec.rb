require 'rspec'
require './lib/translator'

RSpec.describe Translator do
  before :each do
    @translator = Translator.new('./data/dictionary.csv')
  end

  it 'exists' do
    expect(@translator).to be_a Translator
  end

  it 'generates a dictionary' do
    expect(@translator.dots).to be_an Array
    expect(@translator.dots.first).to be_a Dot
    expect(@translator.cells).to be_an Array
    expect(@translator.cells.first).to be_an Array
    expect(@translator.cells.first).to eq ['0', '.', '.', '.', '.', '.',]
  end

  it '#find_cell_by_alpha_char returns a braille cell array' do
    expected = @translator.find_cell_by_alpha_char('a')

    expect(expected).to be_an Array
    expect(expected).to eq ['0', '.', '.', '.', '.', '.',]
  end

  it '#get_braille_chars' do
    string = 'a'
    expected = @translator.get_braille_chars(string)

    expect(expected).to be_an Array
    expect(expected[0]).to be_an Array
    expect(expected[0]).to eq ['0', '.', '.', '.', '.', '.',]
  end

  it '#get_alpha_chars' do
    string1 = "0.\n..\n.."
    string2 = "0.0.\n..0.\n...."
    expected1 = @translator.get_alpha_chars(string1)
    expected2 = @translator.get_alpha_chars(string2)

    expect(expected1).to be_an Array
    expect(expected1).to eq ['a']
    expect(expected2).to eq ['a','b']
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
