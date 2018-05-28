class BookingsController < ApplicationController
  def index
    @review = Review.new
    @reviews = Review.all
    @bookings = current_user.bookings
    @pending_bookings = current_user.bookings.where(state: 0)
    @validated_bookings = current_user.bookings.where(state: 1)
    @canceled_bookings = current_user.bookings.where(state: 2)  
  end

  def create
    trip = Trip.find(params[:trip_id])
    booking  = Booking.create!(price: trip.price, user: current_user)

    redirect_to new_booking_payment_path(booking)
  end
end
