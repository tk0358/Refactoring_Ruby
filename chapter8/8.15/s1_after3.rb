class Person

  def initialize(female, code)
    @female = female
    @code = code
  end

  def self.create_female
    Female.new
  end

  def self.create_male
    Male.new
  end

  def female?
    @female
  end
end

class Female < Person

  def initialize
    super(true, 'F')
  end
  
  # def female?
  #   true
  # end

  def code
    'F'
  end

end

class Male < Person

  def initialize
    super(false, 'M')
  end

  # def female?
  #   false
  # end

  def code
    'M'
  end
end

bree = Person.create_female

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