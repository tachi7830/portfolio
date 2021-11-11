class Bread < ApplicationRecord
  belongs_to :shop

  THUMBNAIL_SIZE = [200, 150]
  mount_uploader :image, ImageUploader
end
