class Product < ApplicationRecord
    has_many :genres
    has_many :cart_items
    has_many :order_items
    attachment :image
end
