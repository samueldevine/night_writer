class Dot
  attr_reader :data

  def initialize(data)
    @data = {
      'a' => data['a'],
      'b' => data['b'],
      'c' => data['c']
    }
  end
end
