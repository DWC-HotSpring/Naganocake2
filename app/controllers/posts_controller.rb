class PostsController < ApplicationController
    def create
        @product = Product.find(params[:product_id])
        @post = Post.new(post_params)
        @post.customer_id = current_customer.id
        if @post.save
            flash[:notice] = "コメントしました"
          else
            render 'products/show'
          end
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :rate, :product_id, :customer_id)
    end

end
