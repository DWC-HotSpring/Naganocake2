class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin
  
  def index
    @products = Product.all
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
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_prams)
    redirect_to admins_product_path(@product)
  end

  private

  def set_admin
    @admin = current_admin
  end
  
  def product_prams
    params.require(:product).permit(:name, :price, :genre_id, :is_active, :description, :image)  
  end

end
