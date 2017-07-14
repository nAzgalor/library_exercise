class Book < ApplicationRecord
  paginates_per 20
  mount_uploader :image, ImageUploader
  belongs_to :user, foreign_key: :reader_id, optional: true

  enum status: %i[in out]
end
