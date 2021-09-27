# frozen_string_literal: true

# The Dot class takes a csv filepath as an argument and creates a @data hash
# with letters as keys and braille characters as values. To add new chars, they
# must be added to the csv as well as this initialize method.

class Dot
  attr_reader :data

  def initialize(data)
    @data = {
      'a' => data['a'],
      'b' => data['b'],
      'c' => data['c'],
      'd' => data['d'],
      'e' => data['e'],
      'f' => data['f'],
      'g' => data['g'],
      'h' => data['h'],
      'i' => data['i'],
      'j' => data['j'],
      'k' => data['k'],
      'l' => data['l'],
      'm' => data['m'],
      'n' => data['n'],
      'o' => data['o'],
      'p' => data['p'],
      'q' => data['q'],
      'r' => data['r'],
      's' => data['s'],
      't' => data['t'],
      'u' => data['u'],
      'v' => data['v'],
      'w' => data['w'],
      'x' => data['x'],
      'y' => data['y'],
      'z' => data['z'],
      ' ' => data[' '],
    }
  end
end
