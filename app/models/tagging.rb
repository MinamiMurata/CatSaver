class Tagging < ApplicationRecord
  belongs_to :blog
  belongs_to :symptom
end
