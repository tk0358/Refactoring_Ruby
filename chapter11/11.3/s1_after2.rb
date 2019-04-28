module AccountNumberCapture

  def capture_account_number
    self.account_number = buyer.preferred_account_number
  end
end


class Bid
  include AccountNumberCapture

  before_save :capture_account_number

end

class Sale
  include AccountNumberCapture

  before_save :capture_account_number

end