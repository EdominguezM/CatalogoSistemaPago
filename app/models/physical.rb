class Physical < ApplicationRecord
  has_many :products, as: :category
  has_many :image, as: :imageable
end
