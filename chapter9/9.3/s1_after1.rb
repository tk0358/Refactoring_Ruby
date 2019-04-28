def disability_amount
	return 0 if @seniority < 2 || @months_disabled > 12 || @is_part_time
  # 傷病手当金を計算
  #...
end