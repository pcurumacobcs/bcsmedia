class LocationNearbyPlaceTag < ApplicationRecord
  belongs_to :location
  belongs_to :nearby_place_tag
end
