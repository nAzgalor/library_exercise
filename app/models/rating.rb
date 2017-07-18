class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :mark, presence: true,
            numericality: { only_integer: true },
            inclusion: { in: 1..5,
                         message: '%{value} is not in range 1..5' }

  validates :user_id, uniqueness: { scope: :book_id,
      message: 'You have already rated it' }
end
