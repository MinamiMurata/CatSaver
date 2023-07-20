class Symptom < ApplicationRecord
  enum category: { eyes: 1, nose: 2, mouth_teeth: 3, ears: 4, skin_hair: 5, paws: 6, buttocks: 7, excretion: 8, appetite: 9, body_temperature: 10, breath: 11, weight: 12, body_others: 13 }
end
