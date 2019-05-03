class JobItem
  attr_reader :quantity

  def initialize(unit_price, quantity, is_labor=false)
    @unit_price = unit_price
    @quantity = quantity
    @is_labor = is_labor
  end

  def total_price
    unit_price * @quantity
  end

  def unit_price
    labor? ? @employee.rate :@unit_price
  end

  def labor?; @is_labor; end
end

class LaborItem < JobItem
  attr_reader :employee

  def initialize(quantity, employee)
    super(0, quantity, true)
    @employee = employee
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