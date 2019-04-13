def print_owing
  outstanding = 0.0

  print_banner

  # 勘定を計算 ( calculate outstanding　)
  @orders.each do |order|
    outstanding += order.amount
  end

  print_details outstanding
end
