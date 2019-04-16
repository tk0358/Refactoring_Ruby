managers = []
employees.each do |e|
  manaegers << e if e.manager?
end