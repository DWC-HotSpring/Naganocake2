class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
    @cart = @product.cart_items.new
  end

end