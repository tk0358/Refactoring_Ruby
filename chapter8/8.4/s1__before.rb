class Currency
  attr_reader :code

  def initialize(code)
    @code = code
  end

  def self.get(code)
    #...レジストリからCurrencyインスタンスを返す
  end
end

usd = Currency.get("USD")