class Cat < ApplicationRecord
  validates :name, presence: true
  belongs_to :breed
end
