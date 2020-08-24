class CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :block_wrong_customer
  before_action :set_customer

  def edit
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def update
    @customer.update(customer_params)
    flash[:notice] = 'お客様の情報が更新されました。'
    redirect_to customer_path(@customer)
  end

  def withdraw
  end

  def withdraw_done
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = 'ありがとうございました。またのご利用をお待ちしております。'
    redirect_to customer_top_path
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :first_name_kana, :last_name, :last_name_kana, :post_code, :prefecture_code, :city, :block, :phone_number)
  end

  def block_wrong_customer
    if params[:id].to_i != current_customer.id
      redirect_to customer_top_path
    end
  end

  def set_customer
    @customer = current_customer
  end
end
