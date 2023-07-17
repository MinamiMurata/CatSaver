class Blog < ApplicationRecord
  belongs_to :user
  belongs_to :cat, optional: true
  validates :title, presence: true
  validates :content, presence: true
  enum age_range: { under_one: 1, one_to_three: 2, four_to_six: 3, seven_to_nine: 4, ten_to_twelve: 5, over_thirteen: 6 }
end
