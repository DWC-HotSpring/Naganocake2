class OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer

  def index
    @orders = @customer.orders
  end
  
  def show
  end

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @order.postage = 800
    @order.payment_method = params[:order][:payment_method]

    @add = params[:order][:add].to_i
    case @add
    when 1
      @order.post_code = @customer.post_code
      @order.prefecture_code = @customer.prefecture_code
      @order.city = @customer.city
      @order.block = @customer.block
      @order.addressee = @customer.full_name
    when 2
      @sta = params[:order][:address].to_i
      @send_to_address = Address.find(@sta)
      @order.post_code = @send_to_address.post_code
      @order.prefecture_code = @send_to_address.prefecture_code
      @order.city = @send_to_address.city
      @order.block = @send_to_address.block
      @order.addressee = @send_to_address.name
    when 3
      @order.post_code = params[:order][:new_add][:post_code]
      @order.prefecture_code = params[:order][:new_add][:prefecture_code]
      @order.city = params[:order][:new_add][:city]
      @order.block = params[:order][:new_add][:block]
      @order.addressee = params[:order][:new_add][:addressee]
    end
  end


  def create
    if current_customer.cart_items.exists?
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
      @order.save
      
      # 住所モデル検索から該当データなければ新規作成は必須でない為コメントアウト
      # @address = Address.new
      # @address.post_code = @order.post_code
      # @address.prefecture_code = @order.prefecture_code
      # @address.city = @order.city
      # @address.block = @order.block
      # @address.name = @order.addressee
      # @address.customer_id = current_customer.id
      # @address.save
      
      # cart_itemsの内容をorder_productsに新規登録
      current_customer.cart_items.each do |cart_item|
        @order_product = OrderProduct.new
        @order_product.order_id = @order.id
        @order_product.product_id = cart_item.product_id
        @order_product.quantity = cart_item.quantity
        @order_product.purchase_price = cart_item.product.price
        @order_product.save
        @customer.cart_items.destroy_all #order_productに情報を移したらcart_itemは消去
      end
      render :thanks
    else
      # redirect_to root_path # rootパス設定後追加
      redirect_to products_path
      flash[:danger] = 'カートが空です。'
    end
  end

  def thanks
  end
  
  private
  def set_customer
    @customer = current_customer
  end
  
  def order_params
    params.require(:order).permit(
      :order_status, :addressee, :post_code, :prefecture_code, :city, :block, :postage, :billing_amount, :payment_method
    )
  end

end
