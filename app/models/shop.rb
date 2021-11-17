class Shop < ApplicationRecord
  has_many :breads, dependent: :destroy
  has_many :article, dependent: :destroy
  has_many :favourites, dependent: :destroy

  THUMBNAIL_SIZE = [200, 150]
  mount_uploader :image, ImageUploader

  geocoded_by :address
  after_validation :geocode
  #登録された住所を緯度経度に変換

  def self.search(search)
    # %keyword%は検索ワードの前後に文字がついていてもkeyword部分が一致すればデータを持ってくる
    # AND検索で検索ワードが空欄の場合 %%となり空のデータになる
    if pref = JpPrefecture::Prefecture.find(search[:prefecture_code])
      where(['name LIKE? AND prefecture_code LIKE?',"%#{search[:keyword]}%", "%#{pref.name}%"])
    else
      where(['name LIKE?',"%#{search[:keyword]}%"])
    end
  end

  def favourited_by?(user)
    favourites.where(user_id: user.id).exists?
  end
end
