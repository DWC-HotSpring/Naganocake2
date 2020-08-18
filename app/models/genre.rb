class Genre < ApplicationRecord
    #boolean型はpresence: trueにしてしまうと、falseをblank?メソッドで空だと認識してエラーとなる
    validates :is_active,  inclusion: { in: [true, false]}
    has_many :products
end
