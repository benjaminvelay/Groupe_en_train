class BookingsController < ApplicationController
  def index
    @trips = Trip.all
    @review = Review.new
    @reviews = Review.all
    @bookings = current_user.bookings
  end

  def create
    @trip = Trip.create(departure_at: params['departure_date'],
                        arrival_at: params['arrival_date'],
                        duration: params['duration'],
                        individual_sncf_price_cents: params['individual_sncf_price_cents'],
                        individual_group_price_cents: params['individual_group_price_cents'],
                        station_departure: params['departure_station'],
                        station_arrival: params['arrival_station']
                      )
    @booking  = Booking.create!(trip: @trip, user: current_user)

    redirect_to bookings_path
  end
end
