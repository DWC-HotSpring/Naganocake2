class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(:id)
    @cart = Cart_item.new
  end

end