def pay_amount
  return dead_amount if @dead
  if @separated
    result = separated_amount
  else
    if @retired
      result = retired_amount
    else
      result = normal_pay_amount
    end
  end
  result
end