class Person

end

class Female < Person
  
  def female?
    true
  end

  def code
    'F'
  end

end

class Male < Person

  def female?
    false
  end

  def code
    'M'
  end
end

require 'minitest/autorun'

class FemaleMaleTest < Minitest::Test
  def setup
    @ruru = Female.new
    @taro = Male.new
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
