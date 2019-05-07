class RatingsController < ApplicationController
  before_action :logged_in_user, :update_rating, only: :create

  def create
    Rating.transaction do
      @rating = current_user.ratings.build ratings_params
      if @rating.save
        flash[:success] = t ".success"
        @rating.book.update_avg_rating
      else
        flash[:danger] = t ".failed"
      end
      redirect_to @rating.book
    end
  end

  private

  def ratings_params
    params.require(:rating).permit :book_id, :rate
  end

  def update_rating
    @rating = current_user.ratings.find_by book_id: ratings_params[:book_id]
    return unless @rating
    if @rating.update_attributes ratings_params
      @rating.book.update_avg_rating
      flash[:success] = t ".success"
      redirect_to @rating.book
    else
      render :create
    end
  end
end
