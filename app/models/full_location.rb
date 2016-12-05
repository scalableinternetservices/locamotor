class FullLocation < ApplicationRecord
  belongs_to :general_location
  has_many :posts, :foreign_key => "start_location_id", :class_name => "Post"
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def self.GetFullAddress(street, city, state)
    full_address = street.strip + " " + city.strip + ", " + state.strip
  end
end
