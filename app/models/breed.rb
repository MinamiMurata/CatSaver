class Breed < ApplicationRecord
  validates :name, presence: true
  has_many :cats
end
