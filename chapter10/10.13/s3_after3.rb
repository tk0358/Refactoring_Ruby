class Account
  def new_withdraw(amount)
    raise BalanceError.new if amount > @balance
    @balance -= amount
  end
end

class BalanceError < StandardError; end

begin
  account.new_withdraw(amount)
  do_the_usual_thing
rescue BalanceError
  handle_overdrawn
end