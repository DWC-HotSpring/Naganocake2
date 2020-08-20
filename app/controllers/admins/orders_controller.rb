class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin
  
  def index
    @orders = Order.all.order(id: "DESC").page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
    redirect_to admins_order_path(@order), notice: "注文ステータスが変更されました"
    else
      rendr :show
    end
  end

  private

  def set_admin
    @admin = current_admin
  end

  def order_params
    params.require(:order).permit(
      :order_status, :addressee, :post_code, :prefecture_code, :city, :block, :postage, :billing_amount, :payment_method
    )
  end
end
