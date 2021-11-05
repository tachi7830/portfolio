class Shop < ApplicationRecord
  has_many :shop_images, dependent: :destroy
  has_many :breads, dependent: :destroy
  has_many :article, dependent: :destroy
end
