class CustomerCompany < ApplicationRecord
  belongs_to :customer
  belongs_to :company
end
