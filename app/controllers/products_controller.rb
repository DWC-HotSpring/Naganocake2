class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
    @cart = Cart_item.new
  end

  private

    def product_params
      params.require(:product).permit(:name, :price, :image_id, :description)
    end

end