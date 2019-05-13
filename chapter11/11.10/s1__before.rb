require 'forwardable'

class Employee
  extend Forwardable
  def_delegators :@person, :name, :name=

  def initialize
    @person = Person.new
  end

  def to_s
    "Emp: #{@person.last_name}"
  end
end

class Person
  attr_accessor :name

  def last_name
    @name.split(' ').last
  end
end