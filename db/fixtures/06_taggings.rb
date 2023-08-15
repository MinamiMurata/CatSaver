require "csv"

csv = CSV.read("db/fixtures/taggings.csv")
csv.each do |tag|
  Tagging.seed do |t|
    t.blog_id = tag[0]
    t.symptom_id = tag[1]
  end
end
