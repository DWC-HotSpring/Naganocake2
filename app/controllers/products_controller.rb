class ProductsController < ApplicationController
  def index
    # 商品の購入回数に応じて上位３位までの商品を降順で取得
    @rank_items = OrderProduct.find(OrderProduct.group(:product_id).order('sum(quantity) desc').limit(3).pluck(:id))
  end

  def show
    @product = Product.find(params[:id])
    @cart = @product.cart_items.new
  end

end