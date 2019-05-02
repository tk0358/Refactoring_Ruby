class Account
  def withdraw(amount)
    raise ArgumentError.new if amount > @balance
    @balance -= amount
  end
end

if !account.can_withdraw?(amount)
  handle_overdrawn
else
  do_the_usual_thing
end