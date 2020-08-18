class Product < ApplicationRecord
    belongs_to :genre
    has_many :cart_items
    has_many :order_items
    attachment :image

    #boolean型はpresence: trueにしてしまうと、falseをblank?メソッドでカラムを空だと認識してエラーとなる
    validates :is_active,  inclusion: { in: [true, false]}
end
