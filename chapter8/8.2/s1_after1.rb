class Order
  attr_accessor :customer

  def initialize(customer)
    @customer = customer
  end
end

class Customer
  attr_reader :name

  def initialize(name)
    @name = name
  end
end