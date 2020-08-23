class AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
  end

  def create
  end

  def edit
    @address = Address.find(params[:id])
		if @address.customer.id != current_customer.id
			redirect_to address_path
		else
			render "edit"
		end
  end

  def show
  end

  def update
    @address = address.find(params[:id])
  		@address.destroy
 		redirect_to books address_path
  end

  def destroy
  end

end
