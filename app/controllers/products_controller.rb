class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart = current_user.orders.find_or_create_by(status: 'cart')
  end
end
