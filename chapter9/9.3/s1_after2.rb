def disability_amount
	return 0 if ineligible_for_disability?
  # 傷病手当金を計算
  #...
end

def ineligible_for_disability?  # 傷病手当金無資格者？
  @seniority < 2 || @months_disabled > 12 || @is_part_time
end