class BookingsController < ApplicationController
  def index
    @trips = Trip.all
    @review = Review.new
    @reviews = Review.all
  end

  def create
    trip = Trip.find(params[:trip_id])
    booking  = Booking.create!(price: trip.price, user: current_user)

    redirect_to new_booking_payment_path(booking)
  end
end
