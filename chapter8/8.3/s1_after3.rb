class Customer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.with_name(name)
    Instances[name]
  end

  Instances = {}

  def self.load_customers
    new("Lemon Car Hire").store
    new("Associated Coffee Machines").store
    new("Bilston Gasworks").store
  end

  def store
    Instances[name] = self
  end
end

class Order

  def initialize(customer_name)
    @customer = Customer.with_name(customer_name)
  end

  def customer_name
    @customer.name
  end

  def customer=(customer_name)
    @customer = Customer.with_name(customer_name)
  end
end

Customer.load_customers
p Customer::Instances
p Customer.with_name("Lemon Car Hire")