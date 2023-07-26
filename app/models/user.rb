class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  has_many :blogs
  has_many :cats
  mount_uploader :image, ImageUploader

  def update_without_password(params)
    params.delete(:current_password)
    params.delete(:password)
    params.delete(:password_confirmation)

    result = update(params)
    clean_up_passwords
    result
  end
end
