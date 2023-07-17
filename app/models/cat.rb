class Cat < ApplicationRecord
  validates :name, presence: true
  belongs_to :breed
  belongs_to :user
  has_many :blogs
end
