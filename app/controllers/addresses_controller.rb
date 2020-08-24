class AddressesController < ApplicationController
  
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "新規登録されました。"
      redirect_to addresses_path
    else
      @addresses = current_customer.addresses
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
    if @address.customer.id != current_customer.id
      flash[:notice] = "アクセス権限がありません。"
      redirect_to addresses_path
		end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

	def address_params
		params.require(:address).permit(:name, :post_code, :prefecture_code, :city, :block, :phone_number)
	end

end
