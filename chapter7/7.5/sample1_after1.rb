class Person
  attr_accessor :department

  def manager
    @department.manager
  end

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

manager = john.manager
p manager.name