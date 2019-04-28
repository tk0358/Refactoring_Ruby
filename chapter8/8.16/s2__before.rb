class Employee
  def initialize
    @assistant = Employee.find_by_boss_id(self.id)
  end
end