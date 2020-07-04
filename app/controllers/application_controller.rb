class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  # エラー404が出た時の例外処理
  # 例外ハンドル
  # rescue_from Exception,                        with: :routing_error
  # rescue_from ActiveRecord::RecordNotFound,     with: :routing_error
  # rescue_from ActionController::RoutingError,   with: :routing_error
  #
  # def routing_error
  #   render template: "homes/top"
  # end

protected
  # ログイン時のパス
  def after_sign_in_path_for(resource)
    if user_signed_in?
      user_path(resource)
    end
  end

  #ログアウト時のパス
  def after_sign_out_path_for(resource)
    root_path
  end

  def my_authenticate_user!
    auth_options = { scope: :user, recall: "homes#top" }
    warden.authenticate!(auth_options)
  end

  # 新規登録の保存機能
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
		    keys: [:name, :email, :residence, :is_child,
        :child_people, :child_age, :is_diaper, :is_baby_food, :user_image_id])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def set_travel
    @travel = Travel.find(params[:id])
  end

  def travel_params
    @travel = Travel.find(params[:travel_id])
  end
end
