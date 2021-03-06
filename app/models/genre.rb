class Genre < ApplicationRecord
    #boolean型はpresence: trueにしてしまうと、falseをblank?メソッドでカラムを空だと認識してエラーとなる
    validates :is_active,  inclusion: { in: [true, false]}
    validates :name, presence: true
    has_many :products
end
