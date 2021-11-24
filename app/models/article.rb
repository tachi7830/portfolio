class Article < ApplicationRecord
  belongs_to :user
  belongs_to :shop, optional: true
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy

  include JpPrefecture
  jp_prefecture :prefecture_code

  THUMBNAIL_SIZE = [220, 150]
  mount_uploaders :images, ImageUploader

  def gooded_by?(user)
    goods.where(user: user).exists?
  end

  validates :shop_id, presence: true
  validates :images, presence: true
  validates :prefecture_code, presence: true
  validates :bread_name, presence: true
  validates :review, presence: true
  validates :rate, presence: true

end
