class CustomerContact < ApplicationRecord
  belongs_to :customer
  belongs_to :contact
end
