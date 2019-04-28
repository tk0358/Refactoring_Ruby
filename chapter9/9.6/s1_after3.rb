def pay_amount
  return dead_amount if @dead
  return separated_amount if @separated
  return retired_amount if @retired
  result = normal_pay_amount
  result
end