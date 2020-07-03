class User::TravelsController < ApplicationController

  before_action :set_travel, only: [:show, :destroy, :edit, :update, :baria_user]
  before_action :baria_user,only: [:edit, :update, :destroy]
  before_action :my_authenticate_user!

  def new
    @travel = Travel.new
    @travel.build_play
    @travel.build_hotel
    @travel.build_meal
    @travel.build_category
    @travel.travel_images.build
  end

  def create
    @travel = current_user.travels.new(travels_params)
    if @travel.save
      # AI

      @travel.travel_images.each do |image|
        tags = Vision.get_image_data(image.image_url.url)
        tags.each do |tag|
          image.tags.create(name: tag)
        end
      end

      flash[:notice] = "投稿しました"
      redirect_to travels_path
    else
      render :new
    end
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
    if @travel.update(travels_update_params)
      @travel.travel_images.each do |image|
        tags = Vision.get_image_data(image.image_url.url)
        binding.pry
        tags.each do |tag|
          image.tags.update(name: tag)
        end
      end
      travels_update_params[:travel_images_attributes].each do |i|
        if i[1]["_destroy"] == "1"
          @image = TravelImage.find(i[1]["id"])
          @image.destroy
        end
      end
      flash[:success] = "投稿しました"
      redirect_to travels_path
    else
      render :edit
    end
  end

  def index
    @travels = []
    @travels_play = []
    @travels_hotel = []
    @travels_meal = []
    q = params[:q]
    travel_result = Travel.ransack(title_cont:q).result
    play_result = Play.ransack(name_cont:q).result
    hotel_result = Hotel.ransack(hotel_name_cont:q).result
    meal_result = Meal.ransack(shop_name_cont:q).result
    Travel.where(is_display: true).each do |travel|
      if travel_result.include?(travel) || play_result.include?(travel.play) || hotel_result.include?(travel.hotel) || meal_result.include?(travel.play)
        @travels.push(travel)
        @travels_play.push(travel) if travel.category.is_play
        @travels_hotel.push(travel) if travel.category.is_hotel
        @travels_meal.push(travel) if travel.category.is_meal
      end
    end
    # if @users = User.ransack(name_cont: q).result == nil
    #   @users.each do |user|
    #     @travels = user.travels.where(is_display: true)
    #   end
    # end

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

  def travels_update_params
    params.require(:travel).permit(:title, :travel_day, :traffic_way, :recommend_age, :evaluation, :is_display,
       play_attributes: [:id, :name, :address, :adult_price, :child_price, :impression, :is_diaper_place, :parking, :official_site],
       hotel_attributes: [:id, :hotel_name, :address, :adult_price, :child_price, :impression, :parking, :official_site],
       meal_attributes: [:id, :shop_name, :address, :adult_price, :child_price, :impression, :is_baby_food_place, :parking, :official_site],
       category_attributes: [:id, :is_play, :is_hotel, :is_meal],
       travel_images_attributes:[:id, :image_url, :_destroy]
    )
  end

  def baria_user
  	if @travel.user != current_user
      redirect_back(fallback_location: root_path)
    end
  end
end
