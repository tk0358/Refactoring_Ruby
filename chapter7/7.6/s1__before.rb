class Person
  def initialize(department)
    @department = department
  end

  def manager
    @department.manager
  end
end

class Department
  attr_reader :manager

  def initialize(manager)
    @manager = manager
  end
end