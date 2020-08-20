class OrderProduct < ApplicationRecord
    belongs_to :order
    belongs_to :product

    enum make_status: {
        not_available: 0,
        waiting: 1,
        making: 2,
        complete: 3,
      }
end
