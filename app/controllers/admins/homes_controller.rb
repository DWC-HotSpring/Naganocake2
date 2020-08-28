class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin

  def top
    @orders = Order.created_today
    # 有効会員のみ取得
    @customers = Customer.where(is_deleted: false)
    # ジャンルが有効かつ販売中の商品のみ取得
    @products = Product.includes(:genre).where(genres: {is_active: true},is_active: true)
  end

  private

  def set_admin
    @admin = current_admin
  end
end
