class Employee
  ENGINEER = 0
  SALESPERSON = 1
  MANAGER = 2

  def self.create(type)
    case type
    when ENGINEER
      Engineer.new
    when SALESPERSON
      Salesperson.new
    when MANAGER
      Manager.new
    else
      raise ArgumentError, "INcorrect type code value"
    end
  end
end

kent = Employee.create(Employee::ENGINEER)