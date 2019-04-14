def price
  base_price = @quantity * @item_price
  if base_price > 1000
    discount_factor = 0.95
  else
    discount_factor = 0.98
  end
  base_price * discount_factor
end


require 'minitest/autorun'

class TestSample1 < Minitest::Test
  def setup
    @quantity = 100
  end

  def test_when_base_price_is_less_than_1000
    @item_price = 9
    assert_equal 882, price
  end
end