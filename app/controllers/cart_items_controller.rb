class CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart_item, only: [:show, :update, :destroy, :edit]
  before_action :set_customer

  def index
    @cart_items = @customer.cart_items.all
  end

  def create
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private

  def set_customer
    @customer = current_customer
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :customer_id, :quantity)
  end
end
