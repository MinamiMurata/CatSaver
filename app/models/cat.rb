class Cat < ApplicationRecord
  validates :name, presence: true
  belongs_to :breed
  belongs_to :user
  has_many :blogs
  mount_uploader :image, ImageUploader

  def self.ransackable_attributes(auth_object = nil)
    %w[name breed_id]
  end
end
