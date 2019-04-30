class Person
  def telephone_number
    office_telephone_number
  end

  def office_telephone_number
    "(#{@officeAreaCode}) #{officeNumber}"
  end
end