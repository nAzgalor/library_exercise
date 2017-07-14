class Book < ApplicationRecord
  mount_uploader :image, ImageUploader

  enum status: %i[in out]
end
