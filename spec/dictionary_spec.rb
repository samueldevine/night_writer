require 'rspec'
require './lib/dictionary'

RSpec.describe Dictionary do
  it 'exists' do
    dictionary = Dictionary.new

    expect(dictionary).to be_a Dictionary
  end
end
