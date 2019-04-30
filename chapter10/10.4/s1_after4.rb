def send_alert_if_miscreant_in(people)
  people.each do |person|
    if person == "Don"
      send_alert
      return
    end
    if person == "John"
      send_alert
      return
    end
  end
  nil
end

def found_person(people)
  people.each do |person|
    return "Don" if person == "Don"
    return "John" if person == "John"
  end
  ""
end

def check_security(people)
  found_miscreant(people)
  found = found_person(people)
  some_later_code(found)
end


def send_alert
  "alert"
end

require 'minitest/autorun'

class FoundPersontTest < Minitest::Test
  def test_don
    people = %w(Michael Don Beck)
    assert_equal "Don", found_person(people)
  end

  def test_john
    people = %w(Mike John Beck)
    assert_equal "John", found_person(people)
  end

  def test_vacant
    people = %w(Mike Beck Ringo)
    assert_equal "", found_person(people)
  end

  def test_both
    people = %w(Michael Don John)
    assert_equal "Don", found_person(people)
  end
end