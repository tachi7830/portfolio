class Article < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :shop
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :article_images, dependent: :destroy
  accepts_attachments_for :article_images, attachment: :image

  validates :rate, presence: true
  validates :rate, numericality: {
    #rateカラムでは整数のみ許可したい
    #only_integer: true,
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0,
  }

end
