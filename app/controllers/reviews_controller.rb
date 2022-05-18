class ReviewsController < ApplicationController
  def new
    # we need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(@restaurant)
  end

  def create
    review = Review.new(review_params)
    review.save
    redirect_to restaurant_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
