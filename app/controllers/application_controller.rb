class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    # ログイン時のパス
    def after_sign_in_path_for(resource)
      # if customer_signed_in?
        user_path(resource)
      # else
      #   admin_top_path
      # end
    end

    #ログアウト時のパス
    def after_sign_out_path_for(resource)
      root_path
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
end
