require "csv"
print " complete.\nSeeding seasons"
{Ers: "January", Carris: "February", Tyir: "March", Rennse: "April", Fyrunn: "May", Medrim: "June", Arridun: "July", Grenn: "August", Ottur: "September", Curnnos: "October", Surrn: "November", Errund: "December", Qvellsvart: "Halloween", Varcindium: "Spring 2"}.each do |name, equivalent|
  Season.find_or_create_by(name: name, equivalent: equivalent)
  print "."
end
print " complete.\nSeeding professions"
  %w(Alchemy Apothecary Astrology Craftsman Herbalist/Mycologist Husbandry Merchant Miner/Geologist Ritualist Physician).each do |profession|
    Profession.find_or_create_by(name: profession)
    print "."
  end
print " complete.\nSeeding components"
CSV.foreach("#{Rails.root}/db/data/seeds.csv", headers: true) do |row|
  component = Ingredient.find_or_initialize_by(name: row["name"])
  component.category = row["category2"].downcase.singularize
  if row["rarity"].downcase == "ex. rare"
    component.rarity = "extra_rare"
  else
    component.rarity = row["rarity"].downcase
  end
  case row["season"]
  when "Any"
    component.seasons = Season.months
  when "Fall"
    component.seasons = Season.fall
  when "Spring"
    component.seasons = Season.spring
  when "Summer"
    component.seasons = Season.summer
  when "Spring/Summer"
    component.seasons = Season.spring + Season.summer
  when "Summer/Any"
    component.seasons = Season.months
  when "Spring/Fall"
    component.seasons = Season.spring + Season.fall
  when "Spring 2/Fall 1"
    component.seasons = Season.where(name: ["Fyrunn", "Medrim", "Grenn", "Ottur"])
    component.staff_notes = "Spring 2/Fall 1"
  when "Spring 2, Fall 1"
    component.seasons = Season.where(name: ["Fyrunn", "Medrim", "Grenn", "Ottur"])
    component.staff_notes = "Spring 2/Fall 1"
  when "Fall 2"
    component.seasons = Season.where(name: ["Surrn", "Errund"])
    component.staff_notes = "Fall 2"
  when "Spring 1"
    component.seasons = Season.where(name: ["Carris", "Tyir"])
    component.staff_notes = "Spring 1"
  when "Varcindium"
    component.seasons << Season.varcindium
  when "Quellsvart"
    component.seasons << Season.quellsvart
  end
  component.level = row["level"]
  component.process_extraction = row["extraction"]
  component.process_calcination = row["calcination"]
  component.process_dissolution = row["dissolution"]
  component.process_concentration = row["concentration"]
  print "." if component.save
end
print " complete."
