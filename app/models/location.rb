class Location < ApplicationRecord
  belongs_to :post
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
