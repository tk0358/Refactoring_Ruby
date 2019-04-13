def print_owing
  outstanding = previous_amount * 1.2
  print_banner
  outstanding = calculate_outstanding(outstanding)
  print_details outstanding
end

def calculate_outstanding(initial_value)
  @orders.inject(initial_value) { |result, order| result + order.amount }
end