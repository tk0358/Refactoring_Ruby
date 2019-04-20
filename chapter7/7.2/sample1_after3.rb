class Account

  def interest_for_amount_days(amount, days)
    interest_rate * amount * days / 365
  end

  def interest_rate
    @account_type.interest_rate
  end
end