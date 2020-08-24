class ProductsController < ApplicationController
  def index
    @products = Product.includes(:genre).where(is_active: true).page(params[:page]).per(12)
    @genres = Genre.where(is_active: true)
  end

  def show
    @product = Product.find(params[:id])
    @cart = @product.cart_items.new
    @genres = Genre.where(is_active: true)
    @post = Post.new
    @average = Post.group(:product_id).average(:rate)
  end

  #ジャンル検索用
  def search
    @genre = Genre.find_by(name: params[:name])   #search_products_pathでparamsとして受けとったジャンル名でfind
    @products = Product.where(genre_id: @genre.id).page(params[:page]).per(10)
    @genres = Genre.where(is_active: true)
    render 'products/index'
  end
end