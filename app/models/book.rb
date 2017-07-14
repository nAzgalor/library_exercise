class Book < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user, foreign_key: :reader_id, optional: true

  enum status: %i[in out]
end
