class Currency
  attr_reader :code

  def initialize(code)
    @code = code
  end

  def self.get(code)
    #...レジストリからCurrencyインスタンスを返す
  end

  def eql?(other)
    self == other
  end

  def ==(other)
    other.equal?(self) ||
      (other.instance_of?(self.class) &&
      other.code == code)
  end

  def hash
    code.hash
  end
end

usd = Currency.get("USD")