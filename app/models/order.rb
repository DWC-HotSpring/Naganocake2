class Order < ApplicationRecord
  enum order_status: {
    waiting: 0,
    confirmation: 1,
    making: 2,
    ready: 3,
    shipped: 4,
  }
  enum payment_method: {
    credit: 0,
    cash: 1,
  }

  belongs_to :customer
  has_many :order_products
  has_many :products, through: :order_products

  
  #jp_prefectureを使用したprefecture_codeからprefecture_nameへの変換
  include JpPrefecture
  jp_prefecture :prefecture_code
  
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
  
  def address
    "%s %s %s %s %s"%([self.post_code,self.prefecture_name,self.city,self.block,self.addressee])
  end
end
