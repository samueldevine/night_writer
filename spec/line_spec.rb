require 'rspec'
require './lib/line'

RSpec.describe Line do
  it 'exists' do
    line1 = Line.new('a' => '.0')

    expect(line1).to be_a Line
  end

  it 'returns braille translations' do
    line1 = Line.new('a' => '.0', 'b' => '.0', 'c' => '..')
    line2 = Line.new('a' => '00', 'b' => '.0', 'c' => '00')
    line3 = Line.new('a' => '00', 'b' => '00', 'c' => '00')

    expect(line1.a).to eq '.0'
    expect(line2.a).to eq '00'
    expect(line3.a).to eq '00'
  end
end
