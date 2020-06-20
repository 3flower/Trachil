class User::TravelsController < ApplicationController

  # before_action :set_user, only: [:show]
  before_action :set_travel, only: [:show, :destroy, :edit]

  def new
    @travel = Travel.new
    @travel.build_play
    @travel.build_hotel
    @travel.build_meal
    @travel.build_category
    @travel.travel_images.build
    # @category = Category.new
    # @play = Play.new
    # @hotel = Hotel.new
    # @meal = Meal.new
    # @image = TravelImage.new
  end

  def create
    @travel = current_user.travels.new(travels_params)
    binding.pry
    if @travel.save
      redirect_to travels_path
    else
      render :new
    end
    binding.pry
  end

  def show
    @comment = Comment.new
    if @travel.user == current_user
      @travel_images = @travel.travel_images
    else
      if @travel.is_display == true
        @travel_images = @travel.travel_images
      else
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def edit
  end

  def update
  end

  def index
    @travels = []
    @travels_play = []
    @travels_hotel = []
    @travels_meal = []
    Travel.where(is_display: true).each do |travel|
      @travels.push(travel)
      @travels_play.push(travel) if travel.category.is_play
      @travels_hotel.push(travel) if travel.category.is_hotel
      @travels_meal.push(travel) if travel.category.is_meal
    end
  end

  def destroy
    @travel.destroy
    flash.now[:alert] = "投稿を削除しました"
    redirect_back(fallback_location: root_path)
  end

  private

  def travels_params
    params.require(:travel).permit(:title, :travel_day, :traffic_way, :recommend_age, :evaluation, :is_display,
       play_attributes: [:id, :name, :address, :adult_price, :child_price, :impression, :is_diaper_place, :parking, :official_site],
       hotel_attributes: [:id, :hotel_name, :address, :adult_price, :child_price, :impression, :parking, :official_site],
       meal_attributes: [:id, :shop_name, :address, :adult_price, :child_price, :impression, :is_baby_food_place, :parking, :official_site],
       category_attributes: [:id, :is_play, :is_hotel, :is_meal],
       travel_images_attributes:[:id, :image_url]
    )
  end
end
