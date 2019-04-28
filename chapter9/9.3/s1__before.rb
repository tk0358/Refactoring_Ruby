def disability_amount
	return 0 if @seniority < 2
	return 0 if @months_disabled > 12
	return 0 if @is_part_time
  # 傷病手当金を計算
  #...
end
  