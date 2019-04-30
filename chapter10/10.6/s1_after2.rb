class Employee
  ENGINEER = 0
  SALESPERSON = 1
  MANAGER = 2

  def self.create(type)
    case type
    when ENGINEER
      Employee.create_engineer
    when SALESPERSON
      Salesperson.new
    when MANAGER
      Manager.new
    else
      raise ArgumentError, "INcorrect type code value"
    end
  end

  def self.create_engineer
    Engineer.new
  end

  def self.create_salesperson
    Salesperson.new
  end

  def self.create_manager
    Manager.new
  end
end

kent = Employee.create(Employee::ENGINEER)