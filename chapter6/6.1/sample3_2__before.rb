def print_owing(previous_amount)
  outstanding = previous_amount * 1.2

  print_banner

  # 勘定を計算 ( calculate outstanding　)
  @orders.each do |order|
    outstanding += order.amount
  end

  print_details outstanding
end
