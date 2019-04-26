class Course
  def initialize(name, advanced)
    @name = name,
    @advanced = advanced
  end
end

class Person

  def initialize
    @courses = []
  end

  def courses
    @courses.dup
  end

  def add_course(course)
    @courses << course
  end

  def remove_course(course)
    @courses.delete(course)
  end

  def initialize_courses(courses)
    raise "Courses should be empty" unless @courses.empty?
    @courses += courses
  end
end

require 'minitest/autorun'

class CourseTest < Minitest::Test
  def test_courses_size
    kent = Person.new
    kent.add_course(Course.new("Smalltalk Programming", false))
    kent.add_course(Course.new("Appreciating Single Malts", true))
    assert_equal 2, kent.courses.size
    refactoring = Course.new("Refactoring", true)
    kent.add_course(refactoring)
    kent.add_course(Course.new("Brutal Sarcasm", false))
    assert_equal 4, kent.courses.size
    kent.remove_course(refactoring)
    assert_equal 3, kent.courses.size
  end
end