module AccountNumberCapture

end


class Bid
  include AccountNumberCapture

  before_save :capture_account_number

  def capture_account_number
    self.account_number = buyer.preferred_account_number
  end
end

class Sale
  include AccountNumberCapture

  before_save :capture_account_number

  def capture_account_number
    self.account_number = buyer.preferred_account_number
  end
end