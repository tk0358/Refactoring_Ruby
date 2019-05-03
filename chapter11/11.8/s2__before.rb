require_relative './movie'
require_relative './rental'

class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    result = "Rental Record for #{@name}\n"
    @rentals.each do |rental|
      # このレンタルの料金を表示
      result << "\t#{rental.movie.title}\t#{rental.charge}\n"
    end
    # フッター行を追加
    result << "Amount owed is #{total_charge}\n"
    result << "You earned #{total_frequent_renter_points} frequent renter points"
  end

  def html_statement
    result = "<h1>Rentals for <em>#{@name}</em></h1><p>\n"
    @rentals.each do |rental|
      # このレンタルの料金を表示
      result << "\t#{rental.movie.title}: #{rental.charge.to_s}<br>\n"
    end
    # フッターを追加
    result << "<p>You owe <em>#{total_charge}</em></p>\n"
    result << "On this rental you earned " +
        "<em>#{total_frequent_renter_points}</em> " +
        "frequent renter points</p>"
  end

  private

  def total_charge
    @rentals.inject(0) { |sum, rental| sum + rental.charge}
  end

  def total_frequent_renter_points
    @rentals.inject(0) { |sum, rental| sum + rental.frequent_renter_points }
  end
end

class Statement
end

module TextStatement
end

module HtmlStatement
end