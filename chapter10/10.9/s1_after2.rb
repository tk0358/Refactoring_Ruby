class Account
  def initialize #テストのために作ったメソッド
    @charges = [] 
  end

  def add_charge(tax_rate, imported, charge)
    total = charge.base_price + charge.base_price * tax_rate
    total += charge.base_price * 0.1 if imported
    @charges << total
  end

  def total_charge
    @charges.inject(0) { |total, charge| total + charge }
  end
end

class Charge
  attr_accessor :base_price, :tax_rate, :imported

  def initialize(base_price, tax_rate, imported)
    @base_price = base_price
    @tax_rate = tax_rate
    @imported = imported
  end
end

require 'minitest/autorun'

class AccountTest < Minitest::Test
  def test_total_charge
    account = Account.new
    account.add_charge(0.1, true, Charge.new(9.0, nil, nil))
    account.add_charge(0.125, false, Charge.new(12.0, nil, nil))
    #...
    total = account.total_charge
    assert_equal 24.3, total
  end
end
