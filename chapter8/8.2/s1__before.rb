class Order
  attr_accessor :customer

  def initialize(customer)
    @customer = customer
  end
end


private_methods
  
def self.number_of_orders_for(orders, customer)
  orders.select { |order| order.customer == customer }.size
end