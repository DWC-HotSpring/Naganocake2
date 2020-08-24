class AddressesController < ApplicationController
  
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
		if @address.customer.id != current_customer.id
      redirect_to address_path
      flash[:error] = "error"
		end
  end

  def update
    @address = Address.find(params[:id])
  	@address.update
 		redirect_to address_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to address_path
  end

  private

	def address_params
		params.require(:address).permit(:name, :post_code, :prefecture_code, :city, :block, :phone_number)
	end

end
