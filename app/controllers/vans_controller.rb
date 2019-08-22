class VansController < ApplicationController
  def index
    @vans = Van.geocoded

    @markers = @vans.map do |van|
      {
        lat: van.latitude,
        lng: van.longitude
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
    params.require(:van).permit(:title, :van_model, :sleeping_capacity, :description, :price_cents, :address)
  end

  def find_van
  end
end
