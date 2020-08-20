module ApplicationHelper
  def price_with_tax(price)
    price = price * 1.08
    "#{price.floor}"
  end

  #時間の表示の簡略化
  def simple_time(time)
    time.strftime("%Y-%m-%d %H:%M ")
    end 
    
end
