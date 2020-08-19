module ApplicationHelper
  def price_with_tax(price)
    price = price * 1.1
    "#{price.floor}"
  end
end
