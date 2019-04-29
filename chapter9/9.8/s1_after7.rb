class Site
  def customer
    @customer || Customer.new_missing
  end
end

class MissingCustomer
  def missing?; true; end

  def name
    'occupant'
  end

  def history
    PaymentHistory.new_null
  end
end

class Customer
  attr_reader :name, :plan, :history

  def missing?; false; end

  def self.new_missing
    MissingCustomer.new
  end
end

class NullPaymentHistory
  def missing?; true; end

  def weeks_delinquent_in_last_year; 0; end
end

class PaymentHistory

  def self.new_null
    NullPaymentHistory.new
  end

  def weeks_delinquent_in_last_year #delinquent:債務不履行の

  end
end

customer = site.customer
plan = customer.missing? ? customer.plan : BillingPlan.basic
#...
customer_name = customer.name
#...
weeks_delinquent = customer.history.weeks_delinquent_in_last_year