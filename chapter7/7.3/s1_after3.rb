class Person
  attr_reader :name

  def initialize
    @office_telephone = TelephoneNumber.new
  end

  def telephone_number
    @office_telephone.telephone_number
  end

  def office_telephone
    @office_telephone
  end

end

class TelephoneNumber
  attr_accessor :area_code, :number

  def telephone_number
    '(' + area_code ')' + number
  end
end