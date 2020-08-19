class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin

  def index
    @customers = Customer.all.order(created_at: :desc)
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_parmas)
      redirect_to admins_customer_path(@customer), notice: '顧客情報を変更しました'
    else
      render :edit
    end
  end

  private

  def set_admin
    @admin = current_admin
  end

  def customer_parmas
    params.require(:customer).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana,:post_code, :prefecture_code, :city, :block, :phone_number, :is_deleted)
  end
end
