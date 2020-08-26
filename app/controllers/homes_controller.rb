class HomesController < ApplicationController
  def about
  end

  def top
    # 商品の購入回数に応じて上位３位までの商品を降順で取得
    @rank_items = OrderProduct.find(OrderProduct.group(:product_id).order('sum(quantity) desc').limit(4).pluck(:id))
    @genres = Genre.where(is_active: true)
    # 商品のオススメ取得
    @recommend_items = Product.where(is_recommend: true).limit(4)
  end
end
