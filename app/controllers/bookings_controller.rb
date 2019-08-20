class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:list, :new, :create]

  def list
    @futur_booking = current_user.bookings.select { |booking| booking.start_date > Date.today }
    @past_booking = current_user.bookings.select { |booking| booking.start_date <= Date.today }

  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def accepted_params
  end

  def find_booking
  end
end
