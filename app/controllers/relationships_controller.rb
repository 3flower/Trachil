class RelationshipsController < ApplicationController

  before_action :user_params, only: [:create, :destroy]

  def create
		following = current_user.follow(@user)
    flash.now[:success] = "フォローしました"
		# redirect_back(fallback_location: root_path)
	end

	def destroy
		following = current_user.unfollow(@user)
    flash.now[:alert] = "フォローを解除しました"
		# redirect_back(fallback_location: root_path)
	end

	private

	def user_params
		@user = User.find(params[:follow_id])
	end
end
