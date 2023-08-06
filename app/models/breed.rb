class Breed < ApplicationRecord
  validates :name, presence: true
  has_many :cats

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
