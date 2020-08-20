class Admins::OrderProductsController < ApplicationController
    def update
        @order_product = OrderProduct.find(params[:id])
        if @order_product.update(order_product_params)
            redirect_to admins_order_path(@order_product.order_id),notice: "制作ステータスが変更されました"
        else
            render :"orders/show"
        end
    end

    private
    def order_product_params
        params.require(:order_product).permit(:make_status)
    end
end