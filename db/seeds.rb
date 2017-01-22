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
print " complete.\nSeeding seasons"
{Ers: "January", Carris: "February", Tyir: "March", Rennse: "April", Fyrunn: "May", Medrim: "June", Arridun: "July", Grenn: "August", Ottur: "September", Curnnos: "October", Surrn: "November", Errund: "December", Qvellsvart: "Halloween", Varcindium: "Spring 2"}.each do |name, equivalent|
  Season.create(name: name, equivalent: equivalent)
  print "."
end
print " complete.\n"
print "Seeding professions"
  %w(Alchemy Apothecary Astrology Craftsman Herbalist/Mycologist Husbandry Merchant Miner/Geologist Ritualist Physician).each do |profession|
    Profession.create(name: profession)
    print "."
  end
print " complete.\n"
