manager_offices = []
employees.each do |e|
  manager_offices << e.office if e.manager?
end