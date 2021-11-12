class Shop < ApplicationRecord
  has_many :breads, dependent: :destroy
  has_many :article, dependent: :destroy
  has_many :favourites, dependent: :destroy

  THUMBNAIL_SIZE = [200, 150]
  mount_uploader :image, ImageUploader

  def self.search(search)
    where(['name LIKE ?', "%#{search}%"])
  end

  def favourited_by?(user)
    favourites.where(user_id: user.id).exists?
  end
end
