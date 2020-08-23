class HomesController < ApplicationController
  def about
  end

  def top
    # 商品の購入回数に応じて上位３位までの商品を降順で取得
    @rank_items = OrderProduct.find(OrderProduct.group(:product_id).order('sum(quantity) desc').limit(4).pluck(:id))
    @genres = Genre.where(is_active: true)
  end
end
