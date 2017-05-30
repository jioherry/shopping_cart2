class ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).per(50)
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_cart_item(@product)
    # add_to_cart action 不是 CRUD 的慣例命名,我們需要在 routes 裡設定這組路由

    current_cart.find_item_by(@product)
    respond_to do |format|
      format.js
    end
    # redirect_to root_path
  end

end
