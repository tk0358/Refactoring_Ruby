require 'forwardable'

class Employee
  include Person
  extend Forwardable
  def_delegators :@person, :name, :name=

  def initialize
    @person = Person.new
  end

  def to_s
    "Emp: #{@person.last_name}"
  end
end

module Person
  attr_accessor :name

  def last_name
    @name.split(' ').last
  end
end