print "Seeding users"
%w(admin foob barb bazb).each do |user|
  User.create(confirmed_at: Time.now, email: "#{user}@example.com", handle: user, first_name: user, last_name: user, password: "password")
  print "."
end
User.find_by(handle: "admin").update(admin: true)
print " complete.\nSeeding characters"
%w(Leslie Ann Tom Ron Andy Ben Chris Donna Jerry).each do |character|
  user = User.order("RANDOM()").first
  Character.create(name: character, user: user, race: Character.races.keys.sample)
  print "."
end
print " complete.\nSeeding components"
%w(lorem ipsum dolor sit amet consectetur adipiscing elit).each do |component|
  Ingredient.create(name: component, category: Ingredient.categories.keys.sample, rarity: Ingredient.rarities.keys.sample)
  print "."
end
print " complete."
