class BookingsController < ApplicationController
  def index
    @review = Review.new
    @reviews = Review.all
  end

  def create
    trip = Trip.find(params[:trip_id])
    booking  = Booking.create!(price: trip.price, state: 'pending...', user: current_user)

    redirect_to new_booking_payment_path(booking)
  end
end
