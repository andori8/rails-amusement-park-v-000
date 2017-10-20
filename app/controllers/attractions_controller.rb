class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update]

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
      if @attraction.save
        redirect_to @attraction
      else
        render "new"
      end
  end

  def index
    @attractions = Attraction.all
    @user = User.find_by(id: session[:user_id])
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end
end
