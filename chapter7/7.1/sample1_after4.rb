class Account
  def overdraft_charge
    @account_type.overdraft_charge(self)
  end

  def bank_charge
    result = 4.5
    if @days_overdrawn > 0
      result += @account_type.overdraft_charge(@days_overdrawn)
    end
    result
  end
end

class AccountType
  def overdraft_charge(account)
    if premium?
      result = 10
      if (account.days_overdrawn > 7)
        result += (account.days_overdrawn - 7) * 0.85
      end
      result
    else
      account.days_overdrawn * 1.75
    end
  end
end