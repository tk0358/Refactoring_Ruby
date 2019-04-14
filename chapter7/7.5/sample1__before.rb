class Person
  attr_accessor :department
  
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Department
  attr_reader :manager

  def initialize(manager)
    @manager = manager
  end

  #...
end

john = Person.new('John')
brian = Person.new('Brian')

sales_department = Department.new(brian)
john.department = sales_department
manager = john.department.manager
p manager.name