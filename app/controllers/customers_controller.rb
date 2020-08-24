class CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :block_wrong_customer
  before_action :set_customer

  def edit
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def withdraw
  end

  def withdraw_done
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to customer_top_path
  end

  private
  def block_wrong_customer
    if params[:id].to_i != current_customer.id
      redirect_to customer_top_path
    end
  end

  def set_customer
    @customer = current_customer
  end
end
