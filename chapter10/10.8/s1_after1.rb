def price
  base_price = @quantity * @item_price
  level_of_discount = discount_level
  discounted_price(base_price, level_of_discount)
end

def discount_level
  return 2 if @quantity > 100
  return 1
end

def discounted_price(base_price, level_of_discount)
  return base_price * 0.1 if level_of_discount == 2
  base_price * 0.05
end