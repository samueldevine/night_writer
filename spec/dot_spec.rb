require 'rspec'
require './lib/dot'

RSpec.describe Dot do
  it 'exists' do
    dot1 = Dot.new('a' => '.')

    expect(dot1).to be_a Dot
  end

  it 'returns braille translations' do
    dot1 = Dot.new('a' => '.')
    dot2 = Dot.new('a' => '0')
    dot3 = Dot.new('a' => '0')
    dot4 = Dot.new('a' => '0')
    dot5 = Dot.new('a' => '0')
    dot6 = Dot.new('a' => '0')

    expect(dot1.data['a']).to eq '.'
    expect(dot2.data['a']).to eq '0'
    expect(dot3.data['a']).to eq '0'
    expect(dot4.data['a']).to eq '0'
    expect(dot5.data['a']).to eq '0'
    expect(dot6.data['a']).to eq '0'
  end
end
