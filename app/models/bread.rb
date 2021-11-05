class Bread < ApplicationRecord
  belongs_to :shop
  attachment :image
end
