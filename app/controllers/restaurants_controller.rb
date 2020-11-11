class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    restaurant = Restaurant.create(strong_params)
    redirect_to restaurant_path(restaurant)
  end

  private
  def strong_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
