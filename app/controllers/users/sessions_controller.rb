# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  # before_action :my_authenticate_user!
  before_action :reject_user, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # ログイン失敗後は def failed に飛ぶように変更
  def create
    auth_options = { scope: resource_name, recall: "#{controller_path}#failed" }
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  # ログイン失敗の時は直前のURLにリダイレクトする
  def failed
    flash[:alert] = "メールアドレスまたはパスワードが違います。"
    redirect_to params[:user][:url]
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # ユーザーが退会済みの時の処理
  def reject_user
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if (@user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false))
        flash[:alert] = "このアカウントは退会済みです。"
        redirect_to root_path
      end
    else
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
