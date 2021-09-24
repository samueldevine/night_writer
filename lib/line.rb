class Line
  attr_reader :letters

  def initialize(data)
    @letters = {
      'a' => data['a'],
      'b' => data['b'],
      'c' => data['c']
    }
  end
end
