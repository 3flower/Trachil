class User::TravelsController < ApplicationController


  def new
    @travel = Travel.new
  end

  def create
    # binding.pry
    @travel = current_user.travels.new(travel_params)
    @play = Play.new(
                  name:   params[:travel][:play_name],
            impression:   params[:travel][:play_impression],
           adult_price:   params[:travel][:play_adult_price],
           child_price:   params[:travel][:play_child_price],
               address:   params[:travel][:play_address],
       is_diaper_place:   params[:travel][:is_diaper_place],
               parking:   params[:travel][:play_parking],
         official_site:   params[:travel][:play_official_site]
    )
    @hotel = Hotel.new(
            hotel_name:   params[:travel][:hotel_name],
            impression:   params[:travel][:hotel_impression],
           adult_price:   params[:travel][:hotel_adult_price],
           child_price:   params[:travel][:hotel_child_price],
               address:   params[:travel][:hotel_address],
               parking:   params[:travel][:hotel_parking],
         official_site:   params[:travel][:hotel_official_site]
    )
    @meal = Meal.new(
             shop_name:   params[:travel][:meal_name],
            impression:   params[:travel][:meal_impression],
           adult_price:   params[:travel][:meal_adult_price],
           child_price:   params[:travel][:meal_child_price],
               address:   params[:travel][:meal_address],
    is_baby_food_place:   params[:travel][:is_baby_food_place],
               parking:   params[:travel][:meal_parking],
         official_site:   params[:travel][:meal_official_site]
    )
    @category = Category.new(
               is_play:   params[:travel][:is_play],
              is_hotel:   params[:travel][:is_hotel],
               is_meal:   params[:travel][:is_meal]
    )
    # binding.pry
    unless @travel.valid? && @play.valid? && @hotel.valid? && @meal.valid? #&& @image.valid?
        render :new
    end
    # @travel.save
    # @play.save
    # @hotel.save
    # @meal.save
    # @image.save

    # @image.save

  end

  def show
  end

  def edit
  end

  def update
  end

  def index
  end

  def destroy
  end

  private

  def travel_params
    params.require(:travel).permit(:title, :travel_day, :traffic_way, :recommend_age, :evaluation, :is_display)
  end

  # def play_params
  #   params.require(:travel).permit(:play_name, :play_impression, :play_adult_price, :play_child_price, :play_address, :is_diaper_place, :play_parking, :play_official_site)
  # end
  #
  # def hotel_params
  #   params.require(:travel).permit(:hotel_name, :hotel_impression, :hotel_adult_price, :hotel_child_price, :hotel_address, :hotel_parking, :hotel_official_site)
  # end
  #
  # def meal_params
  #   params.require(:travel).permit(:meal_name, :meal_impression, :meal_adult_price, :meal_child_price, :meal_address, :is_baby_food_place, :meal_parking, :meal_official_site)
  # end

  def image_params
    params.require(:travel).permit(:image_url)
  end

end
