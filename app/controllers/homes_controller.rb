class HomesController < ApplicationController
  def about
  end

  def top
    # 商品の購入回数に応じて上位３位までの商品を降順で取得
    @rank_items = OrderProduct.find(OrderProduct.group(:product_id).order('sum(quantity) desc').limit(4).pluck(:id))
    @genres = Genre.where(is_active: true)
    # 商品のオススメ取得
    @recommend_items = Product.where(is_recommend: true).order('products.updated_at DESC').limit(4)
    # 商品の新着取得
    @new_products = Product.includes(:genre).where(genres: {is_active: true}).order('products.created_at DESC').limit(4)
  end
end
