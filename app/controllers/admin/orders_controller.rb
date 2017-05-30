class Admin::OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update]

  def index
    if params[:order_status].present?
      @orders = Order.where( :order_status => params[:order_status])
    elsif params[:payment_status].present?
      @orders = Order.where( :payment_status => params[:payment_status])
    else
      @orders = Order.all
    end
  end

	def update
		@order.update(order_params)

		redirct_to admin_orders_path, notice: 'Date Update'
	end

	private

		def set_order
			@order = Order.find(params[:id])
		end

		def order_params
			params.require(:order).permit(	:name,
																			:phone,
																			:address,
																			:email,
																			:amount,
																			:payment_method,
																			:order_status,
																			:payment_status)
		end

end
