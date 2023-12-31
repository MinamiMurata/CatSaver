class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  enum role: { general: 0, admin: 1, guest: 2, guest_admin: 3 }
  has_many :blogs, dependent: :destroy
  has_many :cats, dependent: :destroy
  mount_uploader :image, ImageUploader

  def update_without_password(params)
    params.delete(:current_password)
    params.delete(:password)
    params.delete(:password_confirmation)

    result = update(params)
    clean_up_passwords
    result
  end

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.name = "ゲスト"
      user.password = SecureRandom.urlsafe_base64
      user.role = "guest"
    end
  end

  def self.guest_admin
    find_or_create_by!(email: "guest_admin@example.com") do |admin|
      admin.name = "ゲスト管理者"
      admin.password = SecureRandom.urlsafe_base64
      admin.role = "guest_admin"
    end
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[name email role last_sign_in_at sign_in_count created_at is_deleted]
  end
end
