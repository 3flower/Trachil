class User::CommentsController < ApplicationController

  before_action :travel_params, only: [:create, :destroy]
  before_action :my_authenticate_user!

	def create
		@comment = current_user.comments.new(travel_comment_params)
		@comment.travel_id = @travel.id
    @comment.score = Language.get_data(travel_comment_params[:travel_comment])　#AI
		@comment.save
	end

	def destroy
		@comment = current_user.comments.find_by(travel_id: @travel.id, id: params[:id])
		@comment.destroy
	end

	private
	def travel_comment_params
		params.require(:comment).permit(:travel_comment)
	end
end
