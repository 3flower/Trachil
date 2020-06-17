class User::UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]
  before_action :baria_user, only: [:update, :edit, :destroy]
  before_action :my_authenticate_user!
  # before_action :to_log, only: [:top]

  # def top
  #   flash[:notice] = "もう一度やり直してください"
  # end

  def show
    if @user.is_valid == true
      flash[:notice] = "退会済みのユーザーです"
      redirect_back(fallback_location: root_path)
    else
      @user_follows = @user.followings
      @user_followers = @user.followers

      if @user == current_user
        @user_travels = @user.travels
        @like_travels = current_user.liked_travels
      else
        @user_travels = @user.travels.where(is_display: true)
        @like_travels = current_user.liked_travels.where(is_display: true)
      end
      @user_travel_images = []
      @user_travels.each do |travel|
        travel.travel_images.each do |image|
          @user_travel_images.push(image)
        end
      end
    end
  end

  def quit
    if @user.is_valid == true
      flash[:notice] = "退会済みのユーザーです"
      redirect_back(fallback_location: root_path)
    end
    if @user != current_user
      redirect_to root_path
    end
  end

  def out
    current_user.update(is_valid: true)

    @users = User.all
    # フォローを全て解除する
    @users.each do |user|
      following = current_user.unfollow(user)
      following = user.unfollow(current_user)
    end

    #ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def edit
    if @user.is_valid == true
      flash[:notice] = "退会済みのユーザーです"
      redirect_back(fallback_location: root_path)
    end
    if @user != current_user
      redirect_to root_path
    end
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

  #url直接防止　メソッドを自己定義してbefore_actionで発動。
  def baria_user
  	unless params[:id].to_i == current_user.id
  		redirect_to user_path(current_user)
  	end
  end

  # def to_log
  #   redirect_to root_path if params[:id] == []
  # end

end
