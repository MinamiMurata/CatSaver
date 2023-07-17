require "csv"

csv = CSV.read("db/fixtures/breed.csv")
csv.each do |breed|
  Breed.seed do |s|
    s.id = breed[0]
    s.name = breed[1]
  end
end
