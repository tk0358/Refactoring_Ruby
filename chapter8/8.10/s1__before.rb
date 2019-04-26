class Course
  def initialize(name, advanced)
    @name = name,
    @advanced = advanced
  end
end

class Person
  attr_accessor :courses
end

require 'minitest/autorun'

class CourseTest < Minitest::Test
  def test_courses_size
    kent = Person.new
    courses = []
    courses << Course.new("Smalltalk Programming", false)
    courses << Course.new("Appreciating Single Malts", true)
    kent.courses = courses
    assert_equal 2, kent.courses.size
    refactoring = Course.new("Refactoring", true)
    kent.courses << refactoring
    kent.courses << Course.new("Brutal Sarcasm", false)
    assert_equal 4, kent.courses.size
    kent.courses.delete(refactoring)
    assert_equal 3, kent.courses.size
  end
end
