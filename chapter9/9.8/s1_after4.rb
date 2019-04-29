class Site
  attr_reader :customer
end

class MissingCustomer
  def missing?; true; end
end

class Customer
  attr_reader :name, :plan, :history

  def missing?; false; end

  def self.new_missing
    MissingCustomer.new
  end
end

class PaymentHistory
  def weeks_delinquent_in_last_year #delinquent:債務不履行の

  end
end

customer = site.customer
plan = customer ? customer.plan : BillingPlan.basic
#...
customer_name = customer ? customer.name : 'occupant'
#...
weeks_delinquent = customer.nil? ? 0 : customer.history.weeks_delinquent_in_last_year