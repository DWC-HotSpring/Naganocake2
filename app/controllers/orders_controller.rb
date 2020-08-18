class OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer

  def confirm
  end

  def index
  end

  def new
    @order = Order.new
  end

  def show
  end

  def thanks
  end

  def create
    if current_customer.cart_items.exists?
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id

      @add = params[:order][:add].to_i
      case @add
        when 1
          @order.post_code = @customer.post_code
          @order.prefecture_code = @customer.prefecture_code
          @order.city = @customer.city
          @order.block = @customer.block
          @order.addressee = full_name(@customer)
        when 2
          @order.post_code = params[:order][:post_code]
          @order.send_to_address = params[:order][:send_to_address]
          @order.prefecture_code = params[:order][:prefecture_code]
          @order.city = params[:order][:city]
          @order.block = params[:order][:block]
          @order.addressee = params[:order][:addressee]
        when 3
          @order.post_code = params[:order][:post_code]
          @order.send_to_address = params[:order][:send_to_address]
          @order.prefecture_code = params[:order][:prefecture_code]
          @order.city = params[:order][:city]
          @order.block = params[:order][:block]
          @order.addressee = params[:order][:addressee]
      end
      @order.save

      # send_to_addressで住所モデル検索、該当データなければ新規作成
      if Address.find_by(address: @order.send_to_address).nil?
        @address = Address.new
        @address.post_code = @order.post_code
        @address.address = @order.send_to_address
        @address.addressee = @order.addressee
        @address.customer_id = current_customer.id
        @address.save
      end

      # cart_itemsの内容をorder_itemsに新規登録
      current_customer.cart_items.each do |cart_item|
        order_product = @order.order_products.build
        order_product.order_id = @order.id
        order_product.product_id = cart_item.product_id
        order_product.quantity = cart_item.quantity
        order_product.purchase_price = cart_item.product.price
        order_product.save
        cart_item.destroy #order_itemに情報を移したらcart_itemは消去
      end
      render :thanks
    else
      redirect_to root_path
      flash[:danger] = 'カートが空です。'
    end
  end

  private
  def set_customer
    @customer = current_customer
  end

  def order_params
    params.require(:order).permit(
       :order_status, :addressee, :post_code, :prefecture_code, :city, :block, :postage, :billing_amount, :payment_method,
      )
  end

end
