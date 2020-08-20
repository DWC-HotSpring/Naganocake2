class Order < ApplicationRecord
  enum order_status: {
    入金待ち: 0,
    入金確認: 1,
    製作中: 2,
    発送準備中: 3,
    発送済み: 4,
  }
  enum payment_method: {
    クレジットカード: 0,
    銀行振込: 1,
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
