class User::LikesController < ApplicationController

  before_action :travel_params, only: [:create, :destroy]
  before_action :my_authenticate_user!

  def create
    @like = current_user.likes.new(travel_id: @travel.id)
		@like.save
  end

  def destroy
		@like = current_user.likes.find_by(travel_id: @travel.id)
		@like.destroy
  end
end
