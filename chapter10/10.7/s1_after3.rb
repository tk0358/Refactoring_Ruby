class Room

  def within_plan?(plan)
    low = days_temperature_range.low
    high = days_temperature_range.high
    plan.wighin_range?(days_temperature_range)
  end
end

class HeatingPlan

  def within_range?(room_range)
    (room_range.low >= @range.low) && (room_range.high <= @range.high)
  end
end