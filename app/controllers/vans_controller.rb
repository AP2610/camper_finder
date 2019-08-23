class VansController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    ## search methode
    user_search_input = params[:query]
    if user_search_input
      @vans = Van.search_by_address(user_search_input)
    else
      @vans = Van.all
    end
    # raise

    ## filter method - distance
    user_distance_input = params[:distance]
    if (user_distance_input != "") && (user_search_input != "")
      @vans = Van.near(user_search_input, user_distance_input.to_i)
    end

    # filter method - sleeping capacity
    user_sleepcap_input = params[:sleep_capacity]
    if user_sleepcap_input != ""
      @vans = @vans.select {|van| van.sleeping_capacity >= user_sleepcap_input.to_i }
    end

    # making markers on the map
    @vans = @vans.select {|van| van.latitude && van.longitude}
    @markers = @vans.map do |van|
      {
        lat: van.latitude,
        lng: van.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { van: van })
      }
    end
  end

  def show
    @van = Van.find(params[:id])
    @booking = Booking.new
  end

  def new
    @van = Van.new
  end

  def create
    @van = Van.new(accepted_params)
    @van.user = current_user
    if @van.save
      redirect_to van_path(@van)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def accepted_params
    params.require(:van).permit(:title, :van_model, :sleeping_capacity, :description, :price_cents, :price, :address, :photo)
  end

  def find_van
  end
end
