class Item
  def initialize(base_price, tax_rate)
    @base_price = base_price
    @tax_rate = tax_rate
  end

  def raise_base_price_by(percent)
    @base_price = @base_price * (1 + percent/100.0)
  end

  def total
    @base_price * (1 + @tax_rate)
  end
end