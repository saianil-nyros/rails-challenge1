class DishesController < ApplicationController
  def index
     @dishes = Dish.all
  end
  def show
    @dish = Dish.find(params[:id])
  end
  def search
    @locations = Location.all
    gon.locations = Location.all.select(:latitude,:longitude,:location)
    @taggings = Tagging.all
    @dishes_search  = Dish.where('name LIKE ?',"%#{params[:name]}%")
  if params[:filter]
   @dishes_search = Dish.order(params[:filter]).where('name LIKE ?',"%#{params[:name]}%")
  elsif params[:rating]
     @dishes_search = Dish.where('rating > ? ', params[:rating]).where('name LIKE ?',"%#{params[:name]}%")
  elsif params[:tagging]
    @dishes_search = Dish.where(tagging_id: params[:tagging]).where('name LIKE ?',"%#{params[:name]}%")
  elsif params[:min] and params[:max]
    @dishes_search =  Dish.where('price BETWEEN ? AND ?', params[:min], params[:max]).where('name LIKE ?',"%#{params[:name]}%")
  end
    respond_to do |format|
     format.html
     format.js
   end
  end
  private
  def dish_params
      params.require(:dish).permit(:name,:price,:rating,:image)
  end
  end
