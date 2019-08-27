class ProfilePic < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_one :user
end
