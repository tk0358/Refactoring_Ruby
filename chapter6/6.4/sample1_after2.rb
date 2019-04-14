def price
  a_base_price = base_price
  if base_price > 1000
    discount_factor = 0.95
  else
    discount_factor = 0.98
  end
  a_base_price * discount_factor
end

def base_price
  @quantity * @item_price
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