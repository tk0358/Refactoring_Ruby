if date < SUMMER_START || date > SUMMER_END
	charge = quantity * @winter_rate + @winter_service_charge
else
	charge = quantity * @summer_rate
end