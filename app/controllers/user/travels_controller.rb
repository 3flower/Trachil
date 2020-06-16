class User::TravelsController < ApplicationController


  def new
    @travel = Travel.new
    # @category = Category.new
    # @play = Play.new
    # @hotel = Hotel.new
    # @meal = Meal.new
    # @image = TravelImage.new
  end

  def create
    @travel = current_user.travels.new(travel_params)
    unless @travel.valid?
      render :new and return
    else
      @travel.save
    end

    @play = Play.new(
             travel_id:   @travel.id,
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
             travel_id:   @travel.id,
            hotel_name:   params[:travel][:hotel_name],
            impression:   params[:travel][:hotel_impression],
           adult_price:   params[:travel][:hotel_adult_price],
           child_price:   params[:travel][:hotel_child_price],
               address:   params[:travel][:hotel_address],
               parking:   params[:travel][:hotel_parking],
         official_site:   params[:travel][:hotel_official_site]
    )
    @meal = Meal.new(
             travel_id:   @travel.id,
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
             travel_id:   @travel.id,
               is_play:   params[:travel][:is_play],
              is_hotel:   params[:travel][:is_hotel],
               is_meal:   params[:travel][:is_meal]
    )
    # @image = TravelImage.new
    # unless params.has_value?('travel_images')
    #   unless @image.valid?
    #     render :new and return
    #     @travel.destroy
    #   end
    # end
    # unless params["travel_images"]["image_url_attributes"] == nil
    #   flash[:alert] = "画像を一枚でもアップロードしてください"
    #   render :new
    #   @travel.destroy
    # end

    unless @category.is_play || @category.is_hotel || @category.is_meal
      flash[:alert] = "遊びまたはホテルまたは食事にチェック入れてください"
      render :new
      @travel.destroy
      return
    else
      if @category.is_play
        play_valid = @play.valid?
      end
      if @category.is_hotel
        hotel_valid = @hotel.valid?
      end
      if @category.is_meal
         meal_valid = @meal.valid?
      end
      if play_valid == false || hotel_valid == false || meal_valid == false
        render :new
        @travel.destroy
        return
      end
    end

    params["travel_images"]["image_url_attributes"].each do |image_url|
      TravelImage.create(
      travel_id:    @travel.id,
      image_url:    image_url[1]["image_url"]
      )
    end
    @play.save
    @hotel.save
    @meal.save
    @category.save
    flash[:notice] = "投稿しました。"
    redirect_to travels_path

  end

  def show
  end

  def edit
  end

  def update
  end

  def index
    @travels = []
    Travel.where(is_display: true).each do |travel|
      @travels.push(travel)
    end
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
  # def category_params
  #   params.require(:travel).permit(:is_play, :is_hotel, :is_meal)
  # end
  #
  def image_params
    params.require(:travel).permit([image_url_attributes:[:image_url]])
  end

end
