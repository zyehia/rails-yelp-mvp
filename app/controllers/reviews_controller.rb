class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(restaurant_id: @restaurant.id)
  end

  def create 
    review = Review.new(strong_params)
    review.restaurant_id = params[:restaurant_id]
    review.save
    redirect_to restaurant_path(params[:restaurant_id])
  end

  def strong_params 
    params.require(:review).permit(:rating, :content, :restaurant)
  end
end
