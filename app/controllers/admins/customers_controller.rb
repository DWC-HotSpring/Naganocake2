class Admins::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  private
  def customer_parmas
    params.require(:customer).permit(:email, :first_name, :last_name,:first_name_kana, :last_name_kana,:post_code, :prefecture_code, :city, :block, :city, :phone_number)
  end
end
