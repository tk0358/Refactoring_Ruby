class JobItem
  attr_reader :quantity, :unit_price

  def initialize(unit_price, quantity)
    @unit_price = unit_price
    @quantity = quantity
  end

  def total_price
    unit_price * @quantity
  end
end

class LaborItem < JobItem
  attr_reader :employee

  def initialize(quantity, employee)
    super(0, quantity, true)
    @employee = employee
  end

  def unit_price
    @employee.rate
  end
end

class Employee
  attr_reader :rate

  def initialize(rate)
    @rate = rate
  end
end

j1 = LaborItem.new(0, 5, true, kent)
j2 = JobItem.new(10, 15)