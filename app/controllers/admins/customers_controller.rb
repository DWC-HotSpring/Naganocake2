class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_parmas)
    redirect_to admins_customer_path(@customer)
  end

  private
  def customer_parmas
    params.require(:customer).permit(:email, :first_name, :last_name,:first_name_kana, :last_name_kana,:post_code, :prefecture_code, :city, :block, :phone_number, :is_deleted)
  end
end
