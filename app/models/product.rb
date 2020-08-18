class Product < ApplicationRecord
    belongs_to :genre
    attachment :image

    #boolean型はpresence: trueにしてしまうと、falseをblank?メソッドで空だと認識してエラーとなる
    validates :is_active,  inclusion: { in: [true, false]}
    #enum is_active: {"販売中": true, "売り切れ": false}
end
