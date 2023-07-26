class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  enum age_range: { under_one: 1, one_to_three: 2, four_to_six: 3, seven_to_nine: 4, ten_to_twelve: 5, over_thirteen: 6 }
  belongs_to :user
  belongs_to :cat, optional: true
  has_many :taggings, dependent: :destroy
  has_many :symptoms, through: :taggings
  has_many_attached :images

  def self.ransackable_attributes(auth_object = nil)
    %w[title content disease_name age_range]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[symptoms cat]
  end
end
