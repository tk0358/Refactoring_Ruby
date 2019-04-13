def print_owing
  print_banner
  outstanding = calculate_outstanding

  print_details outstanding
end

def calculate_outstanding
  outstanding = 0.0
  @orders.each do |order|
    outstanding += order.amount
  end
  outstanding
end