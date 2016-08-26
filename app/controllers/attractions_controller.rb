class AttractionsController < ApplicationController

  def index

    if current_user.admin
      @link = "New Attraction"
      @intro= "Show"
    else
      @link = nil
      @intro = "Go on"
    end



    @attractions = Attraction.all
  end

  def show
    if current_user.admin
      @link = "Edit Attraction"

    else
      @link = nil

    end


    @attraction = Attraction.find(params[:id])
    #need to make some changes to this view
  end

  def ride

    @user = current_user
    @ride = Ride.new
    @ride.user=@user
    @attraction = Attraction.find(params[:attraction_id].to_i)
    @ride.attraction= @attraction

    @ride.take_ride

    @ride.save
    @user.save

    flash[:notice] = @ride.notice
    redirect_to user_path(@user)
  end

  def new
    @attraction = Attraction.new

  end

  def edit

    @attraction = Attraction.find(params[:id].to_i)
    #just added this and edit.html.erb
  end

  def update

    @attraction = Attraction.find(params[:id].to_i)
    @attraction.update(safe_params)
    redirect_to attraction_path(@attraction)
    #just added this
  end

  def create
    @attraction = Attraction.create(safe_params)
    redirect_to attraction_path(@attraction)
  end

  def safe_params

    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)

  end

end
