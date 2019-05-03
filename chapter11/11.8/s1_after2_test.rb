require 'minitest/autorun'
require_relative './s1_after2'

class CustomerStatementTest < Minitest::Test
  def setup
    @regular_movie = Movie.new('die_hard', RegularPrice.new)
    @new_movie = Movie.new('aflo', NewReleasePrice.new)
    @child_movie = Movie.new('sazae', ChildrensPrice.new)
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

  def test_html_statement
    @customer.add_rental(Rental.new(@regular_movie, 2))
    @customer.add_rental(Rental.new(@new_movie, 2))
    @customer.add_rental(Rental.new(@child_movie, 3))
    expected = "<h1>Rentals for <em>Ruru</em></h1><p>\n"
    expected += "\t" + 'die_hard' + ": " + '2' + "<br>\n"
    expected += "\t" + 'aflo' + ": " + '6' + "<br>\n"
    expected += "\t" + 'sazae' + ": " + '1.5' + "<br>\n"
    expected += "<p>You owe <em>9.5</em></p>\n"
    expected += "On this rental you earned " +
    "<em>4</em> frequent renter points</p>"
    assert_equal expected, @customer.html_statement
  end
end