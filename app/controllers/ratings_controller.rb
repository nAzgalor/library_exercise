class RatingsController < ApplicationController
  def create
    #TODO when error 
    @rating = current_user.ratings.new(rating_params.merge(book_id: params[:book_id]))
    if @rating.save
      redirect_to book_path(params[:book_id]), notice: 'You mark is accepted'
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:mark)
  end
end
