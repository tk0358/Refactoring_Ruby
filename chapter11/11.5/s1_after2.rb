class JobItem
  def initialize(unit_price, quantity, is_labor=false, employee=nil)
    @unit_price = unit_price
    @quantity = quantity
    @is_labor = is_labor
    @employee = employee
  end

  def total_price
    unit_price * @quantity
  end

  def unit_price
    labor? ? @employee.rate :@unit_price
  end

  def labor?; @is_labor; end
  
  attr_reader :quantity, :employee
end

class LaborItem < JobItem
  def initialize(unit_price, quantity, is_labor, employee)
    super
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