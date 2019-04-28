class Employee
  def assistant
    unless instance_variable_defined? :@assistant
      @assistant = Employee.find_by_boss_id(self.id)
    end
    @assistant
  end
end