class Cat < ApplicationRecord
  validates :name, presence: true
  belongs_to :breed
  belongs_to :user
  has_many :blogs

  def self.ransackable_attributes(auth_object = nil)
    ["breed_id"]
  end
end
