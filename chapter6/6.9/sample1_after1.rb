class Account

  def gamma(input_val, quantity, year_to_date)
    important_value1 = (input_val * quantity) + delta
    important_value2 = (input_val * year_to_date) + 100
    if (year_to_date - important_value1) > 100
      important_value2 -= 20
    end
    important_value3 = important_value2 * 7
    # 等々
    important_value3 - 2 * important_value1
  end
end

class Gamma
  attr_reader :account, :input_val, :quantity, :year_to_date,
    :important_value1, :important_value2, :important_value3
  
  def initialize(account, input_val_arg, quantity_arg, year_to_date_arg)
    @account = account
    @input_val = input_val_arg
    @quantity = quantity_arg
    @year_to_date = year_to_date_arg
  end

  def compute
    @important_value1 = (input_val * quantity) + @account.delta	#<=
    @important_value2 = (input_val * year_to_date) + 100
    if (year_to_date - important_value1) > 100
      @important_value2 -= 20
    end
    @important_value3 = important_value2 * 7
    # 等々
    @important_value3 - 2 * important_value1
  end
end