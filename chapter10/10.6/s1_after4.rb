class Employee
  ENGINEER = 0
  SALESPERSON = 1
  MANAGER = 2

  def self.create(type)
    case type
    when ENGINEER
      Employee.create_engineer
    when SALESPERSON
      Employee.create_salesperson
    when MANAGER
      Employee.create_manager
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

kent = Employee.create_manager