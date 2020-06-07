class User::UsersController < ApplicationController

  before_action :set_user, onry: [:show, :edit, :update]
  before_action :my_authenticate_user!

  def show
  end

  def quit
  end

  def out
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "登録情報を更新しました。"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    if is_child = true
      params.require(:user).permit(:name, :email, :residence, :is_child,
      :child_people, :child_age, :is_diaper, :is_baby_food, :user_image_id, :introduction)
    elsif is_child = false
      params.require(:user).permit(:name, :email, :residence, :is_child, :user_image_id, :introduction)
    end
  end

end
