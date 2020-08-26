class PostsController < ApplicationController
    def create
        @product = Product.find(params[:product_id])
        @post = Post.new(post_params)
        @post.customer_id = current_customer.id
        if @post.save
            flash[:notice] = "コメントしました"
            @average_rate = @product.posts.average(:rate).round(1).to_f
            @product.update_attribute(:average_rate, @average_rate)
          else
            render 'products/show'
          end
    end

    def destroy
      @product = Product.find(params[:product_id])
      @post = Post.find_by(id: params[:id], product_id: params[:product_id])
      @post.destroy
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :rate, :product_id, :customer_id)
    end

end
