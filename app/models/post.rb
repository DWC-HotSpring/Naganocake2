class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  with_options presence: true do
    validates :title
    validates :content
    validates :customer_id
    validates :product_id
  end
end
