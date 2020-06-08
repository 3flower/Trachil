class User::TravelsController < ApplicationController


  def new
    @travel = Travel.new
    @play = Play.new
    @hotel = Hotel.new
    @meal = Meal.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def index
  end

  def destroy
  end

end
