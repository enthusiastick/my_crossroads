require "csv"
print " complete.\nSeeding seasons"
{Ers: "January", Carris: "February", Tyir: "March", Rennse: "April", Fyrunn: "May", Medrim: "June", Arridun: "July", Grenn: "August", Ottur: "September", Curnnos: "October", Surrn: "November", Errund: "December", Qvellsvart: "Halloween", Varcindium: "Spring 2"}.each do |name, equivalent|
  Season.find_or_create_by(name: name, equivalent: equivalent)
  print "."
end
print " complete.\n"
print "Seeding professions"
  %w(Alchemy Apothecary Astrology Craftsman Herbalist/Mycologist Husbandry Merchant Miner/Geologist Ritualist Physician).each do |profession|
    Profession.find_or_create_by(name: profession)
    print "."
  end
print " complete.\n"
# CSV.foreach("#{Rails.root}/db/data/seeds.csv", headers: true) do |row|
#   binding.pry
# end
