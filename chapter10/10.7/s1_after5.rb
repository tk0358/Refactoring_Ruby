class Room

  def within_plan?(plan)
    plan.wighin_temperature_range?(days_temperature_range)
  end
end

class HeatingPlan

  def within_temperature_range?(room_temperature_range)
    @range.includes?(room_temperature_range)
  end
end

class TempRange

  def includes?(temperature_range)
    temperature_range.low >= low && temperature_range.high <= high
  end
end