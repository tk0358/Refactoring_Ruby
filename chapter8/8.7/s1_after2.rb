class Order
  attr_accessor :customer

end

require 'set'

class Customer

  def initialize
    @orders = Set.new
  end

  def friend_orders
    # Orderがリンクを更新するときにのみ使われる
    @orders
  end
end