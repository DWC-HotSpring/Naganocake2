class Admins::SearchesController < ApplicationController
    def search
        @model = params["model"]
        @content = params["content"]
        @how = params["how"]
        @datas = search_for(@how, @model, @content)
    end


    private
    
    def match(model, content)
      if model == 'customer'
        Customer.where(name: content)
      elsif model == 'product'
        Product.where(title: content)
      end
    end
  
    def forward(model, content)
      if model == 'customer'
        Customer.where(['first_name ? OR last_name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
      elsif model == 'product'
        Product.where("title LIKE ?", "#{content}%")
      end
    end
  
    def backward(model, content)
      if model == 'customer'
        Customer.where(['first_name ? OR last_name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
      elsif model == 'product'
        Product.where("title LIKE ?", "%#{content}")
      end
    end
  
    def partical(model, content)
      if model == 'customer'
        Customer.where(['first_name ? OR last_name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
      elsif model == 'product'
        Product.where("title LIKE ?", "%#{content}%")
      end
    end
  
    def search_for(how, model, content)
      case how
      when 'match'
        match(model, content)
      when 'forward'
        forward(model, content)
      when 'backward'
        backward(model, content)
      when 'partical'
        partical(model, content)
      end
    end
end
