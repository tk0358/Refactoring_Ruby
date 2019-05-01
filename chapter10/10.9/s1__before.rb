class Account
  def initialize #テストのために作ったメソッド
    @charges = [] 
  end

  def add_charge(base_price, tax_rate, imported)
    total = base_price + base_price * tax_rate
    total += base_price * 0.1 if imported
    @charges << total
  end

  def total_charge
    @charges.inject(0) { |total, charge| total + charge }
  end
end

require 'minitest/autorun'

class AccountTest < Minitest::Test
  def test_total_charge
    account = Account.new
    account.add_charge(9.0, 0.1, true)
    account.add_charge(12.0, 0.125, false)
    #...
    total = account.total_charge
    assert_equal 24.3, total
  end
end
