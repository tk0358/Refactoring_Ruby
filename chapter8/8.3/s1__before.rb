class Customer
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Order

  def initialize(customer_name)
    @customer = Customer.new(customer_name)
  end

  def customer_name
    @customer.name
  end

  def customer=(customer_name)
    @customer = Customer.new(customer_name)
  end
end

private

def self.number_of_orders_for(orders, customer)
  orders.select { |order| order.customer_name == customer.name }.size
end

ruru = Customer.new('Ruru')
order1 = Order.new('Ruru')