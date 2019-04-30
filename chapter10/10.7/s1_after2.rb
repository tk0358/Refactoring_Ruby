class Room

  def within_plan?(plan)
    low = days_temperature_range.low
    high = days_temperature_range.high
    plan.wighin_range?(days_temperature_range, high)
  end
end

class HeatingPlan

  def within_range?(room_range, high)
    (room_range.low >= @range.low) && (high <= @range.high)
  end
end