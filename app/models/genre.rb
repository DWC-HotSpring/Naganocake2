class Genre < ApplicationRecord
    #boolean型はpresence: trueにしてしまうと、falseをblank?メソッドで空だと認識してエラーとなる
    validates :is_active,  inclusion: { in: [true, false]}
    #enum is_active: {"有効": true, "無効": false}
    has_many :products
end
