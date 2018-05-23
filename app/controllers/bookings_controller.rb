class BookingsController < ApplicationController
  def index
    @review = Review.new
    @reviews = Review.all
    @bookings = current_user.bookings
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @booking = current_user.bookings.create(state: 'pending...', trip: @trip)
    redirect_to bookings_path
  end
end
