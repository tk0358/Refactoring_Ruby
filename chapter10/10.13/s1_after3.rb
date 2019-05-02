class Account
  include Assertions
  #...

  def withdraw(amount)
    assert("amount too large") { amount <= @balance }
    @balance -= amount
  end
end

module Assertions
  class AssertionFailedError < StandardError; end

  def assert(message, &condition)
    unless condition.call
      raise AssertionFailedError.new("Assertion Failed: #{message}")
    end
  end
end

if !account.can_withdraw?(amount)
  handle_overdrawn
else
  do_the_usual_thing
end