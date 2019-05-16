def price
  base_price * discount_factor
end

def base_price
  @quantity * @item_price
end

def discount_factor
  (base_price > 1000) ? 0.95 : 0.98
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