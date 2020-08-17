class Admins::ProductsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    
  end

  def edit
  end

  private
  def product_prams
    params.require(:product).permit(:name, :price, :genre_id, :is_active, :description, :image)  
  end

end
