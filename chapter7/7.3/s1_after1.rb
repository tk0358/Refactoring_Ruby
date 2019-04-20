class Person
  attr_reader :name
  attr_accessor :office_area_code
  attr_accessor :office_number

  def initialize
    @office_telephone = TelephoneNumber.new
  end

  def telephone_number
    '(' + @office_area_code + ')' + @office_number
  end
end

class TelephoneNumber
end