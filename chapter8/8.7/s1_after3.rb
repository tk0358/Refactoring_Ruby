class Order
  attr_reader :customer

  def customer=(value)
    customer.friend_orders.subtract(self) unless customer.nil?
    @customer = value
    customer.friend_orders.add(self) unless customer.nil?
  end
end

require 'set'

class Customer

  def initialize
    @orders = Set.new
  end

  def friend_orders
    # Orderがリンクを更新するときにのみ使われる
    @orders
  end
end