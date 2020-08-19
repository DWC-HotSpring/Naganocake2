class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items
  has_many :products, through: :cart_items
  has_many :orders
  has_many :addresses

  #バリデーション(空欄)
  with_options presence: true do
    validates :email
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :post_code
    validates :prefecture_code
    validates :city
    validates :block
    validates :phone_number
  end


  def full_name
    self.first_name + self.last_name
  end

  def full_adress
    self.prefecture_name + self.city + self.block
  end
  
  
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
    "%s %s %s"%([self.prefecture_name,self.city,self.block])
  end
end
