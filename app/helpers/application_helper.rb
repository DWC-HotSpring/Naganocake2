module ApplicationHelper
  def price_with_tax(price)
    price = price * 1.08
    "#{price.floor}円"
  end
end
