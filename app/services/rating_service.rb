class RatingService
  MAX_MARK = 5

  def initialize(book)
    @book = book
  end

  def call
    calculate
  end

  private

  def calculate
    marks = @book.ratings.pluck(:mark)
    result = marks.reduce(:+).to_f / marks.size
  end
end