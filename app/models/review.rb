class Review < ApplicationRecord
  belongs_to :cocktail
  validates :rating, presence: true, numericality: { only_integer: true }
end
