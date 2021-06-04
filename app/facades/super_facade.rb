class SuperFacade
  def self.seed_db
    supers = SuperService.get_supers

    supers.each do |sup|
      data = {
        name: sup[:name],
        intelligence: sup[:powerstats][:intelligence],
        strength: sup[:powerstats][:strength],
        speed: sup[:powerstats][:speed],
        gender: sup[:appearance][:gender],
        race: sup[:appearance][:race],
        height: sup[:appearance][:height][0],
        weight: sup[:appearance][:weight][0],
        first_appearance: sup[:biography][:firstAppearance],
        full_name: sup[:biography][:fullName],
        publisher: sup[:biography][:publisher],
        image: sup[:images][:md]
      }
      
      Super.create(data)
    end
  end

end