class Account
  def initialize #テストのために作ったメソッド
    @charges = [] 
  end

  def add_charge(charge)
    @charges << charge
  end

  def total_charge
    @charges.inject(0) { |total_for_account, charge| total_for_account + charge.total }
  end
end

class Charge
  def initialize(base_price, tax_rate, imported)
    @base_price = base_price
    @tax_rate = tax_rate
    @imported = imported
  end

  def total
    result = @base_price + @base_price * @tax_rate
    result += @base_price * 0.1 if @imported
    result
  end
end

require 'minitest/autorun'

class AccountTest < Minitest::Test
  def test_total_charge
    account = Account.new
    account.add_charge(Charge.new(9.0, 0.1, true))
    account.add_charge(Charge.new(12.0, 0.125, false))
    #...
    total = account.total_charge
    assert_equal 24.3, total
  end
end
