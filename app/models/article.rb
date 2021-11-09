class Article < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :favourites, dependent: :destroy

  include JpPrefecture
  jp_prefecture :prefecture_code

  THUMBNAIL_SIZE = [250, 150]
  mount_uploaders :images, ImageUploader

  def gooded_by?(user)
    goods.where(user_id: user.id).exists?
  end

  validates :rate, presence: true
  validates :rate, numericality: {
    #rateカラムでは整数のみ許可したい
    #only_integer: true,
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0,
  }

end
