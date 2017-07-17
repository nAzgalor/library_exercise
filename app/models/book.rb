class Book < ApplicationRecord
  paginates_per 20
  mount_uploader :image, ImageUploader
  belongs_to :user, foreign_key: :reader_id, optional: true

  enum status: %i[in out]

  def self.top_5_books
    all.first(5)
  end
end
