class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin
  
  def index
    @products = Product.all.order(created_at: :desc)
    @products = Product.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
  
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
    redirect_to admins_product_path(@product), notice: '商品を追加しました'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
    redirect_to admins_product_path(@product), notice: '商品情報を変更しました'
    else
      render :edit
    end
  end

  private

  def set_admin
    @admin = current_admin
  end
  
  def product_params
    params.require(:product).permit(:name, :price, :genre_id, :is_active, :description, :image)  
  end

end
