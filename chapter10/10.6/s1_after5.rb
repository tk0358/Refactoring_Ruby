class Employee
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