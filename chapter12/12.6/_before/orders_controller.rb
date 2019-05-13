class OrdersController < ApplicationController

  MINIMUM_ORDER_AMOUNT = 100

  def create
    @order_lines = []
    params[:order_line].each_value do |order_line_params|
      unless all_values_blank?(order_line_params)
        amount = Product.find(order_line_params[:product_id]).price
        @order_lines << OrderLine.new(
          order_line_params.merge(:amount => amount)
        )
      end
    end

    @order = Order.new(params[:order])

    if total_amount_for_order_lines(@order_lines) >= MINIMUM_ORDER_AMOUNT
      begin
        Order.transaction do
          @order.order_lines = @order_lines
          @order.save!
        end
      rescue ActiveRecord::ActiveRecordError
        render_new
        return
      end
    else
      flash[:error] = "An order must be at least $#{MINIMUM_ORDER_AMOUNT}"
      render_new
      return
    end
    redirect_to :action => 'index'
  end

  private

  def render_new
    @order_lines = [OrderLine.new] * 5 if @order_lines.empty?
    render :action => 'new'
  end

  def total_amount_for_order_lines(order_lines)
    order_lines.inject(0) do |total, order_line|
      total + (order_line.amount * order_line.quantity)
    end
  end
end
