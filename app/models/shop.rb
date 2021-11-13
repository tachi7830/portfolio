class Shop < ApplicationRecord
  has_many :breads, dependent: :destroy
  has_many :article, dependent: :destroy
  has_many :favourites, dependent: :destroy

  THUMBNAIL_SIZE = [200, 150]
  mount_uploader :image, ImageUploader

  def self.search(keyword)
    #jp_prefecture公式の検索コード 
    #find(Parametersで送られたPrefecture_code(文字列を（to_i）で数値に変換して
    #Prefectureのデータの数値と一致するものを探す。
    pref = JpPrefecture::Prefecture.find(keyword[:prefecture_code].to_i)
    where(['name LIKE? OR area LIKE?',"%#{keyword}%", "%#{pref.name}%"])
    #nameカラムから[keyword]と一致するものを探す。
  end

  def favourited_by?(user)
    favourites.where(user_id: user.id).exists?
  end
end
