class Person

  def initialize(female, code)
    @female = female
    @code = code
  end

  def self.create_female
    Person.new(true, 'F')
  end

  def self.create_male
    Person.new(false, 'M')
  end

  def female?
    @female
  end

  def code
    @code
  end
end

require 'minitest/autorun'

class FemaleMaleTest < Minitest::Test
  def setup
    @ruru = Person.create_female
    @taro = Person.create_male
  end

  def test_female
    assert @ruru.female?
    assert_equal 'F', @ruru.code
  end

  def test_male
    refute @taro.female?
    assert_equal 'M', @taro.code
  end
end