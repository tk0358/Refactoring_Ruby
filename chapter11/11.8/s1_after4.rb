require_relative './movie'
require_relative './rental'

class Customer
  attr_reader :name, :rentals

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    TextStatement.new.value(self)
  end

  def html_statement
    HtmlStatement.new.value(self)
  end

  def total_charge
    @rentals.inject(0) { |sum, rental| sum + rental.charge}
  end

  def total_frequent_renter_points
    @rentals.inject(0) { |sum, rental| sum + rental.frequent_renter_points }
  end
end

class Statement
  def value(customer)
    result = header_string(customer)
    customer.rentals.each do |rental|
      result << each_rental_string(rental)
    end
    result << footer_string(customer)
  end
end

class TextStatement < Statement


  def header_string(customer)
    "Rental Record for #{customer.name}\n"
  end

  def each_rental_string(rental)
    "\t#{rental.movie.title}\t#{rental.charge.to_s}\n"
  end

  def footer_string(customer)
    <<~EOS
      Amount owed is #{customer.total_charge}
      You earned #{customer.total_frequent_renter_points} frequent renter points
    EOS
  end
end

class HtmlStatement < Statement
  def value(customer)
    result = header_string(customer)
    customer.rentals.each do |rental|
      result << each_rental_string(rental)
    end
    result << footer_string(customer)
  end

  def header_string(customer)
    "<h1>Rentals for <em>#{customer.name}</em></h1><p>\n"
  end

  def each_rental_string(rental)
    "\t" + rental.movie.title + ": " + rental.charge.to_s + "<br>\n"
  end

  def footer_string(customer)
    <<~EOS
      <p>You owe <em>#{customer.total_charge}</em></p>
      On this rental you earned <em>#{customer.total_frequent_renter_points}</em> frequent renter points</p>
    EOS
  end
end