class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:list, :new]

  def list
    @futur_booking = current_user.bookings.select { |booking| booking.start_date > Date.today }
    @past_booking = current_user.bookings.select { |booking| booking.start_date <= Date.today }

  end

  # def new
  #   @booking = Booking.new
  #   raise
  # end

  def create
    @booking = Booking.new
    @booking.pax = accepted_params[:pax].to_i if accepted_params[:pax] != ""
    @booking.start_date = Date.parse(accepted_params[:start_date]) if accepted_params[:start_date] != ""
    @booking.end_date = Date.parse(accepted_params[:end_date]) if accepted_params[:end_date] != ""
    @booking.van = Van.find(params[:van_id])
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_list_path
    else
      @van = @booking.van
      redirect_to new_user_session_path
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_list_path
  end

  private

  def accepted_params
    params.require(:booking).permit(:start_date, :end_date, :pax)
  end

  def find_booking
  end
end
