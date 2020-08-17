class Admins::ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
  
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_prams)
    @product.save
    redirect_to admins_product_path(@product)
  end

  def edit
  end

  private
  def product_prams
    params.require(:product).permit(:name, :price, :genre_id, :is_active, :description, :image)  
  end

end
