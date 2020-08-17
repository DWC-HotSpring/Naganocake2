class Genre < ApplicationRecord
    validates :is_active,  inclusion: { in: [true, false]}
    #enum is_active: {active: true, inactive: false}
    has_many :products
end
