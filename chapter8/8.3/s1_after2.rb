class Customer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.create(name)
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
    @customer = Customer.create(customer_name)
  end

  def customer_name
    @customer.name
  end

  def customer=(customer_name)
    @customer = Customer.create(customer_name)
  end
end
