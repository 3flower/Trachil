class User::UsersController < ApplicationController

  before_action :set_user, onry: [:show, :edit]
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
  end

end
