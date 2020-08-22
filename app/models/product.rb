class Product < ApplicationRecord
    require "date"

    belongs_to :genre
    has_many :cart_items
    has_many :order_products
    has_many :products, through: :order_products
    attachment :image
    has_many :favorites, dependent: :destroy

    def favorited_by?(customer)
      favorites.where(customer_id: customer.id).exists?
    end

    #一週間以内に登録されたか判定するメソッド
    def new_arrival?
      now = Date.today
      self.created_at.between?(1.week.ago, now)
    end

    #boolean型はpresence: trueにしてしまうと、falseをblank?メソッドでカラムを空だと認識してエラーとなる
    validates :is_active,  inclusion: { in: [true, false]}

    with_options presence: true do
        validates :name
        validates :price
        validates :genre_id
        validates :image
        validates :description
      end

end
