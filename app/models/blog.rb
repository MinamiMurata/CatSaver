class Blog < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  enum age_range: { default: 0, under_one: 1, one_to_three: 2, four_to_six: 3, seven_to_nine: 4, ten_to_twelve: 5, over_thirteen: 6 }
end
