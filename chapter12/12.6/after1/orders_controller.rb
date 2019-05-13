class OrdersController < ApplicationController

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

    begin
      Order.transaction do
        @order.order_lines = @order_lines
        @order.save!
      end
    rescue ActiveRecord::ActiveRecordError
      @order_lines = [OrderLine.new] * 5 if @order_lines.empty?
      render :action => 'new'
      return
    end
    redirect_to :action => 'index'
  end

end
