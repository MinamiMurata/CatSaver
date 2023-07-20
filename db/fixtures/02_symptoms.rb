require "csv"

csv = CSV.read("db/fixtures/symptoms.csv")
csv.each do |symptom|
  Symptom.seed do |s|
    s.id = symptom[0]
    s.category = symptom[1].to_i
    s.detail = symptom[2]
  end
end
