require 'set'

class Order
  # 管理メソッド
  def add_customer(customer)
    customer.friend_orders.add(self)
    @customers.add(customer)
  end

  def remove_customer(customer)
    customer.friend_orders.subtract(self)
    @customers.subtract(customer)
  end
end

class Customer

  def add_order(order)
    order.add_customer(self)
  end

  def remove_order(order)
    order.remove_customer(self)
  end

  def friend_orders
    # Orderがリンクを更新するときにのみ使われる
    @orders
  end
end