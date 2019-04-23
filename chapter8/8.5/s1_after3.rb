class Performance
  attr_reader :name

  def wins
    @wins.to_i
  end

  def initialize
    @data = []
  end

  def []=(index, value)
    @data.insert(index, value)
  end

  def [](index)
    @data[index]
  end
end

row = Performance.new
row[0] = "Liverpool"
row[1] = "15"

name = row.name
wins = row.wins