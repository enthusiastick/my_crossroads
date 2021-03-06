[["Alchemy", "Alchemist"], ["Astrology", "Astrologer"], ["Craftsman", "Artisan"], ["Herbalist/Mycologist", "Herbalist"], ["Husbandry", "Zoologist"], ["Miner/Geologist", "Geologist"]].each do |pair|
  profession = Profession.find_by(name: pair.first)
  profession.update(name: pair.second) if profession.present?
end

recipes = [9,
10,
11,
12,
13,
15,
16,
19,
21,
25,
27,
31,
32,
33,
34,
37,
38,
42,
44,
46,
48,
51,
54,
57,
59,
60,
61,
63,
64,
67,
71,
72,
73,
75,
76,
79,
80,
81,
82,
83,
84,
93,
97,
98,
101,
103,
104,
108,
109,
110,
111,
112,
113,
114,
115,
116,
123,
124,
127,
128,
129,
130,
137,
140,
141,
142,
146,
147,
148,
152,
154,
156,
157,
159,
162]
recipes.each do |recipe|
  CharacterRecipe.create(character_id:19, recipe_id:recipe)
  CharacterRecipe.create(character_id:39, recipe_id:recipe)
  CharacterRecipe.create(character_id:11, recipe_id:recipe)
  CharacterRecipe.create(character_id:15, recipe_id:recipe)
  CharacterRecipe.create(character_id:72, recipe_id:recipe)
  CharacterRecipe.create(character_id:33, recipe_id:recipe)
end
# require 'csv'
# csv_text = File.read(Rails.root.join('db', 'data', 'recipes_seed.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   r = Recipe.new
#     r.hex_code = row["hex_code"],
#     r.name = row["name"],
#     r.subtype = row["subtype"],
#     r.category = row["category"],
#     r.level = row["level"],
#     r.effect_family = row["effect_family"],
#     r.delivery = row["delivery"],
#     r.application_time = row["application_time"],
#     r.duration = row["duration"],
#     r.expiration = row["expiration"],
#     r.effect = row["effect"],
#     r.description = row["description"],
#     r.expiration = row["expiration"],
#     r.extraction_ingredient_id = row[ "extraction_ingredient_id"],
#     r.calcination_ingredient_id = row[ "calcination_ingredient_id"],
#     r.dissolution_ingredient_id = row[ "dissolution_ingredient_id"],
#     r.concentration_ingredient_id = row[ "concentration_ingredient_id"],
#   r.save
# end
