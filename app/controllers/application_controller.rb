class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

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

    # エラー404が出た時の例外処理
    # rescue_from ActiveRecord::RecordNotFound, with: :render_404
    # rescue_from ActionController::RoutingError, with: :render_404
    # rescue_from Exception, with: :render_500
    # def render_404
    #   render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
    # end
    #
    # def render_500
    #   render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
    # end

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
