class Location < ApplicationRecord
  has_many :posts, :foreign_key => "start_location_id", :class_name => "Post"
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
