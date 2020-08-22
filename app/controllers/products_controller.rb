class ProductsController < ApplicationController
  def index
    @products = Product.includes(:genre).where(is_active: true).page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
    @cart = @product.cart_items.new
  end

end