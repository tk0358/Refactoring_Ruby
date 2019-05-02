class Account
  def withdraw(amount)
    begin
      new_withdraw(amount)
      return 0
    rescue BalanceError
      return -1
    end
  end

  def new_withdraw(amount)
    raise BalanceError.new if amount > @balance
    @balance -= amount
  end
end

class BalanceError < StandardError; end

if account.withdraw(amount) == -1
  handle_overdrawn
else
  do_the_usual_thing
end