class CustomersController < ApplicationController
  def edit
    @customer = Customer.find(params[:id])
		if @customer.user.id != current_user.id
			redirect_to customer_path
		else
			render "edit"
		end
  end

  def show
  end
end
