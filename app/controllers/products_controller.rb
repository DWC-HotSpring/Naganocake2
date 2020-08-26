class ProductsController < ApplicationController
  def index
    @products = Product.includes(:genre).where(genres: {is_active: true}).page(params[:page]).per(12)
    @genres = Genre.where(is_active: true)
    @product_number = Product.includes(:genre).where(genres: {is_active: true}).size

    #ソート検索用
    if params[:option] == "new"
      @products = Product.includes(:genre).where(genres: {is_active: true}).order('products.created_at DESC').page(params[:page]).per(12)
    elsif params[:option] == "price_low"
      @products = Product.includes(:genre).where(genres: {is_active: true}).order('price ASC').page(params[:page]).per(12)
    elsif params[:option] == "price_high"
      @products = Product.includes(:genre).where(genres: {is_active: true}).order('price DESC').page(params[:page]).per(12)
    elsif params[:option] == "hot_selling"
      @products = Kaminari.paginate_array(Product.find(OrderProduct.group(:product_id).order('sum(quantity) desc').pluck(:product_id))).page(params[:page]).per(12)
    elsif params[:option] == "star"
      @products = Product.includes(:genre).where(genres: {is_active: true}).order('average_rate DESC').page(params[:page]).per(12)
    end
    
  end

  def show
    @product = Product.find(params[:id])
    @cart = @product.cart_items.new
    @genres = Genre.where(is_active: true)
    @post = Post.new
  end


  #ジャンル検索用
  def search
    @genre = Genre.find_by(name: params[:name])   #search_products_pathでparamsとして受けとったジャンル名でfind
    @products = Product.where(genre_id: @genre.id).page(params[:page]).per(10)
    @genres = Genre.where(is_active: true)
    render 'products/index'
  end
end