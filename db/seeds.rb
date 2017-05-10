[["Alchemy", "Alchemist"], ["Astrology", "Astrologer"], ["Craftsman", "Artisan"], ["Herbalist/Mycologist", "Herbalist"], ["Husbandry", "Zoologist"], ["Miner/Geologist", "Geologist"]].each do |pair|
  profession = Profession.find_by(name: pair.first)
  profession.update(name: pair.second) if profession.present?
end
