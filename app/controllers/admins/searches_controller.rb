class Admins::SearchesController < ApplicationController
    def search
        @model = params["model"]
        @content = params["content"]
        @datas = search_for(@model, @content)
    end


    private
  
    def search_for(model, content)
      if model == 'customer'
        Customer.where(['first_name LIKE ? OR last_name LIKE ?', "%#{content}%", "%#{content}%"])
      elsif model == 'product'
        Product.where("name LIKE ?", "%#{content}%")
      end
    end

end
