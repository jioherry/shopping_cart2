class Admin::OrdersController < ApplicationController

	def index
		@orders = Order.all
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
