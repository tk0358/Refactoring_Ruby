def print_owing
  outstanding = 0.0

  print_banner

  # 勘定を計算 ( calculate outstanding　)
  @orders.each do |order|
    outstanding += order.amount
  end

  print_details outstanding
end

def print_banner
  # バナーを出力
  puts "*************************"
  puts "***** Customer Owes *****"
  puts "*************************"
end

def print_details(outstanding)
  # 詳細を表示 ( print details )
  puts "name: #{@name}"
  puts "amount: #{outstanding}"
end