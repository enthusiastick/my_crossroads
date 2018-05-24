[["Alchemy", "Alchemist"], ["Astrology", "Astrologer"], ["Craftsman", "Artisan"], ["Herbalist/Mycologist", "Herbalist"], ["Husbandry", "Zoologist"], ["Miner/Geologist", "Geologist"]].each do |pair|
  profession = Profession.find_by(name: pair.first)
  profession.update(name: pair.second) if profession.present?
end
require 'csv'
csv_text = File.read(Rails.root.join('db', 'data', 'recipes_seed.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  r = Recipe.new
    r.hex_code = row["hex_code"],
    r.name = row["name"],
    r.subtype = row["subtype"],
    r.category = row["category"],
    r.level = row["level"],
    r.effect_family = row["effect_family"],
    r.delivery = row["delivery"],
    r.application_time = row["application_time"],
    r.duration = row["duration"],
    r.expiration = row["expiration"],
    r.effect = row["effect"],
    r.description = row["description"],
    r.expiration = row["expiration"],
    r.extraction_ingredient_id = row[ "extraction_ingredient_id"],
    r.calcination_ingredient_id = row[ "calcination_ingredient_id"],
    r.dissolution_ingredient_id = row[ "dissolution_ingredient_id"],
    r.concentration_ingredient_id = row[ "concentration_ingredient_id"],
  r.save
end
