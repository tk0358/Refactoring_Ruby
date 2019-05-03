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

class Statement; end

class TextStatement < Statement
  def value(customer)
    result = header_string(customer)
    customer.rentals.each do |rental|
      # このレンタルの料金を表示
      result << "\t#{rental.movie.title}\t#{rental.charge.to_s}\n"
    end
    # フッター行を追加
    result << "Amount owed is #{customer.total_charge}\n"
    result << "You earned #{customer.total_frequent_renter_points} frequent renter points"
  end

  def header_string(customer)
    "Rental Record for #{customer.name}\n"
  end
end

class HtmlStatement < Statement
  def value(customer)
    result = header_string(customer)
    customer.rentals.each do |rental|
      # このレンタルの料金を表示
      result << "\t" + rental.movie.title + ": " + rental.charge.to_s + "<br>\n"
    end
    # フッターを追加
    result << "<p>You owe <em>#{customer.total_charge}</em></p>\n"
    result << "On this rental you earned " +
        "<em>#{customer.total_frequent_renter_points}</em> " +
        "frequent renter points</p>"
  end

  def header_string(customer)
    "<h1>Rentals for <em>#{customer.name}</em></h1><p>\n"
  end
end