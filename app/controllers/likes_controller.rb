class LikesController < ApplicationController

  before_action :travel_params, only: [:create, :destroy]

  def create
    @favorite = current_user.favorites.new(travel_id: @travel.id)
		@favorite.save
  end

  def destroy
		@favorite = current_user.favorites.find_by(travel_id: @travel.id)
		@favorite.destroy
  end
end
