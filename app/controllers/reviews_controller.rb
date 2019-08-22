class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
    @van = Van.find(params[:van_id])
  end

  def create
    @review = Review.new(review_params)

    @booking = Booking.find(params[:booking_id])
    @van = Van.find(params[:van_id])

    @review.booking = @booking


    if @review.save
      redirect_to bookings_list_path
    else
      render :new
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
