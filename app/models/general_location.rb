class GeneralLocation < ApplicationRecord
  has_many :full_locations
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def self.GetGeneralAddress(city, state)
    general_address = city.strip + ", " + state.strip
  end


  def get_full_locations_near(search_address, distance, valid_location_list)
    full_location_records = self.full_locations

    full_location_records.each do |fl|
      puts "checking?"
      if fl.distance_to(search_address) < distance
        puts "we are adding something here"
        valid_location_list.push(fl.id)
      else
        puts "address is #{fl.address}"
        puts "search address is #{search_address}"
        puts "distance is #{fl.distance_to(search_address)}"
      end
    end

    return valid_location_list
  end

end
