def pay_amount
  return dead_amount if @dead
  return separated_amount if @separated
  if @retired
    result = retired_amount
  else
    result = normal_pay_amount
  end
  result
end