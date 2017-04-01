# require "csv"
# print "\nSeeding seasons"
# {Ers: "January", Carris: "February", Tyir: "March", Rennse: "April", Fyrunn: "May", Medrim: "June", Arridun: "July", Grenn: "August", Ottur: "September", Curnnos: "October", Surrn: "November", Errund: "December", Qvellsvart: "Halloween", Varcindium: "Spring 2"}.each do |name, equivalent|
#   Season.find_or_create_by(name: name, equivalent: equivalent)
#   print "."
# end
# print " complete.\nSeeding professions"
#   %w(Alchemy Apothecary Astrology Craftsman Herbalist/Mycologist Husbandry Merchant Miner/Geologist Ritualist Physician).each do |profession|
#     Profession.find_or_create_by(name: profession)
#     print "."
#   end
# print " complete.\nSeeding components:"
# CSV.foreach("#{Rails.root}/db/data/seeds.csv", headers: true) do |row|
#   component = Ingredient.find_or_initialize_by(name: row["name"])
#   component.category = row["category2"].downcase.singularize
#   if row["rarity"].downcase == "ex. rare"
#     component.rarity = "extra_rare"
#   else
#     component.rarity = row["rarity"].downcase
#   end
#   case row["season"]
#   when "Any"
#     component.seasons = Season.months
#   when "Fall"
#     component.seasons = Season.fall
#   when "Spring"
#     component.seasons = Season.spring
#   when "Summer"
#     component.seasons = Season.summer
#   when "Spring/Summer"
#     component.seasons = Season.spring + Season.summer
#   when "Summer/Any"
#     component.seasons = Season.months
#   when "Spring/Fall"
#     component.seasons = Season.spring + Season.fall
#   when "Spring 2/Fall 1"
#     component.seasons = Season.where(name: ["Fyrunn", "Medrim", "Grenn", "Ottur"])
#     component.staff_notes = "Spring 2/Fall 1"
#   when "Spring 2, Fall 1"
#     component.seasons = Season.where(name: ["Fyrunn", "Medrim", "Grenn", "Ottur"])
#     component.staff_notes = "Spring 2/Fall 1"
#   when "Fall 2"
#     component.seasons = Season.where(name: ["Surrn", "Errund"])
#     component.staff_notes = "Fall 2"
#   when "Spring 1"
#     component.seasons = Season.where(name: ["Carris", "Tyir"])
#     component.staff_notes = "Spring 1"
#   when "Varcindium"
#     component.seasons << Season.varcindium
#   when "Quellsvart"
#     component.seasons << Season.qvellsvart
#   end
#   component.grade = row["grade"]
#   component.process_extraction = row["extraction"]
#   component.process_calcination = row["calcination"]
#   component.process_dissolution = row["dissolution"]
#   component.process_concentration = row["concentration"]
#   print " #{component.name}." if component.save
# end
# print "\nComponent seeding complete."

address = "1 Headquarters Rd Williamsburg, MA 01096"
latitude = 42.452611
longitude = -72.794706
directions = "#### Directions to Camp Howe\n\n##### From East:\n\nI-90 West to I-91 North (Exit 4 on Mass. Pike). Take 91 North to Exit 19. Go STRAIGHT off of ramp (left and right turns are route 9) Follow Daimon/ Bridge Road aprox 5 miles (through several lights) until it comes to a stop sign in front of LOOK PARK Turn Right on Route 9 West. You will travel through a the town of Williamsburg and then into Goshen. In the center of Goshen (after you pass the Whale Inn), you will see a white church on the left and a school and church on the right. After the library, take the next right onto East Street. There is a large sign on the corner pointing to 4-H Camp Howe. Go half a mile to Goshen Police station and the DAR State Forest Headquarters (brown buildings on the left). Turn left behind the police station and follow the dirt road into camp.\n\n##### From North:\n\nTake I-91 south to Northampton (Routes 5-10-9). Take a right at the first set of lights. Follow to Route 9. Turn right on Route 9 heading West to Williamsburg. You will go through the town of Williamsburgh and then you will come into Goshen. It will be about15 miles from Northampton. In the center of Goshen (after you pass the Whale Inn), you will see a white church on the left and a school and church on the right. After the library, take the next right onto East Street. There is a large sign on the corner pointing to 4-H Camp Howe. Go half a mile to Goshen Police station and the DAR State Forest Headquarters (brown buildings on the left). Turn left behind the police station and follow the dirt road into camp.\n\n##### From South:\n\nTake I-91 North to exit 18 Northampton. Turn left on Route 9 heading West to Williamsburg. You will go through the towns of Florence, Williamsburgh and then you will come into Goshen. It will be about15 miles from Northampton. In the center of Goshen (after you pass the Whale Inn), you will see a white church on the left and a school and church on the right. After the library, take the next right onto East Street. There is a large sign on the corner pointing to 4-H Camp Howe. Go half a mile to Goshen Police station and the DAR State Forest Headquarters (brown buildings on the left). Turn left behind the police station and follow the dirt road into camp.\n\n##### From West:\n\nTake the Mass Pike to Pittsfield, MA. In Pittsfield, follow Route 9 East through Dalton. You will go through Windsor Mountain and Cummington. You will then come into the town of Goshen. After you pass the Fire station on your left you will see a left turn and a sign for 4-H Camp Howe across from the white church. Turn left. Go half a mile to Goshen Police station and the DAR State Forest Headquarters (brown buildings on the left). Turn left behind the police station and follow the dirt road into camp."

event1 = Event.find_or_initialize_by(name: "Spring One 2017")
unless event1.persisted?
  event1.assign_attributes(start_date: "2017-05-05 22:00:00 -0400", end_date: "2017-05-07 15:00:00 -0400", address: address, latitude: latitude, longitude: longitude, directions: directions)
  event1.save
end

event2 = Event.find_or_initialize_by(name: "Spring Two 2017")
unless event2.persisted?
  event2.assign_attributes(start_date: "2017-06-02 22:00:00 -0400", end_date: "2017-06-04 15:00:00 -0400", address: address, latitude: latitude, longitude: longitude, directions: directions)
  event2.save
end

event3 = Event.find_or_initialize_by(name: "Fall One 2017")
unless event3.persisted?
  event3.assign_attributes(start_date: "2017-08-25 22:00:00 -0400", end_date: "2017-08-27 15:00:00 -0400", address: address, latitude: latitude, longitude: longitude, directions: directions)
  event3.save
end

event4 = Event.find_or_initialize_by(name: "Fall Two 2017")
unless event4.persisted?
  event4.assign_attributes(start_date: "2017-10-06 22:00:00 -0400", end_date: "2017-10-08 15:00:00 -0400", address: address, latitude: latitude, longitude: longitude, directions: directions)
  event4.save
end
