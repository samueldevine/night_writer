class Line
  attr_reader :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o, :p,
              :q, :r, :s, :t, :u, :v, :w, :x, :y, :z

  def initialize(data)
    @a = data['a']
    @b = data['b']
    @c = data['c']
  end
end
