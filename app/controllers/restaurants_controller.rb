class RestaurantsController < ApplicationController
 def index
 end
 def show
   @restaurant = Restaurant.find(params[:id])
 end
 def map
 	  @location = Location.find(params[:id])
 	
 end
end
