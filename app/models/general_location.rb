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
      if fl.distance_to(search_address) < distance
        valid_location_list.push(fl.id)
      end
    end

    return valid_location_list
  end

  def get_full_locations_near_as_location(search_address, distance, valid_location_list)
    full_location_records = self.full_locations

    full_location_records.each do |fl|
      if fl.distance_to(search_address) <= distance
        valid_location_list.push(fl)
      end
    end

    return valid_location_list
  end

  def get_full_locations_near_as_location_exclude(search_address, distance, valid_location_list, exclude_list)
    full_location_records = self.full_locations

    full_location_records.each do |fl|
      if fl.distance_to(search_address) <= distance && !fl.in?(exclude_list)
        valid_location_list.push(fl)
      end
    end

    return valid_location_list
  end

end
