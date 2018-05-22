class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    if @review.save
      respond_to do |format|
        format.html { redirect_to options_path }
        format.js  # render`
      end
    else
      respond_to do |format|
        format.html { render :create }
        format.js  # render
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
