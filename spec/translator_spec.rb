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
    expect(@translator.cells).to be_an Array
    expect(@translator.cells.first).to be_a Dot
  end

  it '#translate outputs an array of braille strings' do
    braille_a = @translator.translate('a')

    expect(braille_a).to be_an Array
    expect(braille_a[0].length).to eq 6
    expect(braille_a[0]).to eq ['.', '0', '0', '0', '0', '0',]
  end

  it '#translate can translate multiple chars' do
    braille_abc = @translator.translate('abc')

    expect(braille_abc).to be_an Array
    expect(braille_abc.length).to eq 3
    expect(braille_abc[0][0]).to eq '.'
    expect(braille_abc[1][0]).to eq '.'
    expect(braille_abc[2][0]).to eq '.'
  end
end
