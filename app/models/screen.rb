class Screen < ApplicationRecord
  belongs_to :screen_type
  belongs_to :screen_brand
  belongs_to :location
end
