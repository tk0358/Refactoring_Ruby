require 'minitest/autorun'
require_relative '../lib/customer'
# require_relative './rental'
# require_relative './movie'

class CustomerStatementTest < Minitest::Test
  def setup
    @regular_movie = Movie.new('die_hard', Movie::REGULAR)
    @new_movie = Movie.new('aflo', Movie::NEW_RELEASE)
    @child_movie = Movie.new('sazae', Movie::CHILDRENS)
    @customer = Customer.new('Ruru')
  end

  def test_regular_movie_2days_rental
    @customer.add_rental(Rental.new(@regular_movie, 2))
    expected = "Rental Record for Ruru\n"
    expected +=  "\t" + 'die_hard' + "\t" + '2' + "\n"
    expected += "Amount owed is 2\n"
    expected += "You earned 1 frequent renter points"
    assert_equal expected, @customer.statement
  end

  def test_regular_movie_5days_rental
    @customer.add_rental(Rental.new(@regular_movie, 5))
    expected = "Rental Record for Ruru\n"
    expected +=  "\t" + 'die_hard' + "\t" + '6.5' + "\n"
    expected += "Amount owed is 6.5\n"
    expected += "You earned 1 frequent renter points"
    assert_equal expected, @customer.statement
  end

  def test_new_movie_1day_rental
    @customer.add_rental(Rental.new(@new_movie, 1))
    expected = "Rental Record for Ruru\n"
    expected +=  "\t" + 'aflo' + "\t" + '3' + "\n"
    expected += "Amount owed is 3\n"
    expected += "You earned 1 frequent renter points"
    assert_equal expected, @customer.statement
  end

  def test_new_movie_2days_rental
    @customer.add_rental(Rental.new(@new_movie, 2))
    expected = "Rental Record for Ruru\n"
    expected +=  "\t" + 'aflo' + "\t" + '6' + "\n"
    expected += "Amount owed is 6\n"
    expected += "You earned 2 frequent renter points"
    assert_equal expected, @customer.statement
  end

  def test_child_movie_3days
    @customer.add_rental(Rental.new(@child_movie, 3))
    expected = "Rental Record for Ruru\n"
    expected +=  "\t" + 'sazae' + "\t" + '1.5' + "\n"
    expected += "Amount owed is 1.5\n"
    expected += "You earned 1 frequent renter points"
    assert_equal expected, @customer.statement
  end

  def test_child_movie_5days
    @customer.add_rental(Rental.new(@child_movie, 5))
    expected = "Rental Record for Ruru\n"
    expected +=  "\t" + 'sazae' + "\t" + '4.5' + "\n"
    expected += "Amount owed is 4.5\n"
    expected += "You earned 1 frequent renter points"
    assert_equal expected, @customer.statement
  end

  def test_3movies_rental
    @customer.add_rental(Rental.new(@regular_movie, 2))
    @customer.add_rental(Rental.new(@new_movie, 2))
    @customer.add_rental(Rental.new(@child_movie, 3))
    expected = "Rental Record for Ruru\n"
    expected +=  "\t" + 'die_hard' + "\t" + '2' + "\n"
    expected +=  "\t" + 'aflo' + "\t" + '6' + "\n"
    expected +=  "\t" + 'sazae' + "\t" + '1.5' + "\n"
    expected += "Amount owed is 9.5\n"
    expected += "You earned 4 frequent renter points"
    assert_equal expected, @customer.statement
  end
end