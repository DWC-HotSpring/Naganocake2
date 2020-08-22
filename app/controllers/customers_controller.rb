class CustomersController < ApplicationController
  def edit
  end

  def show
    @customer = Customer.find(params[:id])
  end
end
