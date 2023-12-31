class Cat < ApplicationRecord
  validates :name, presence: true
  belongs_to :breed
  belongs_to :user
  has_many :blogs, dependent: :destroy
  mount_uploader :image, ImageUploader

  def self.ransackable_attributes(auth_object = nil)
    %w[name breed_id created_at]
  end
end
