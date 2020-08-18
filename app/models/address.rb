class Address < ApplicationRecord
  belongs_to :customer

  
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
    "%s %s %s %s %s"%([self.post_code,self.prefecture_name,self.city,self.block,self.name])
  end
end
