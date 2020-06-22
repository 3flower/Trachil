class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :search

  # def search
  #   q = params[:q]
  #   @Travels = Travel.search(title_cont: q).result
  #   @users = User.search(name_cont: q).result
  #   @plays = Play.search(name_cont: q).result
  #   @hotels = Hotel.search(hotel_name_cont: q).result
  #   @meals = Meal.search(shop_name_cont: q).result
  # end

  # エラー404が出た時の例外処理
  # 例外ハンドル
  unless Rails.env.development?
    rescue_from Exception,                        with: :_render_500
    rescue_from ActiveRecord::RecordNotFound,     with: :_render_404
    rescue_from ActionController::RoutingError,   with: :_render_404
  end

  def routing_error
    raise ActionController::RoutingError, params[:path]
  end

  def _render_404(e = nil)
    logger.info "Rendering 404 with exception: #{e.message}" if e

    if request.format.to_sym == :json
      render json: { error: '404 error' }, status: :not_found
    else
      render 'errors/404', status: :not_found
    end
  end

  def _render_500(e = nil)
    logger.error "Rendering 500 with exception: #{e.message}" if e
    Airbrake.notify(e) if e # Airbrake/Errbitを使う場合はこちら

    if request.format.to_sym == :json
      render json: { error: '500 error' }, status: :internal_server_error
    else
      render 'errors/500', status: :internal_server_error
    end
  end

protected
  # ログイン時のパス
  def after_sign_in_path_for(resource)
    if user_signed_in?
      user_path(resource)
    # else
    #   admin_top_path
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
    if is_child = true
      devise_parameter_sanitizer.permit(:sign_up,
			    keys: [:name, :email, :residence, :is_child,
          :child_people, :child_age, :is_diaper, :is_baby_food, :user_image_id])
    elsif is_child = false
      devise_parameter_sanitizer.permit(:sign_up,
        keys: [:name, :email, :residence, :is_child, :user_image_id])
    end
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
