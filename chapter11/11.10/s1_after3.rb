class Employee
  include Person

  def to_s
    "Emp: #{last_name}"
  end
end

module Person
  attr_accessor :name

  def last_name
    @name.split(' ').last
  end
end