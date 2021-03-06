class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:all]
  def index
    @review = Review.new
    @reviews = Review.all
    @user_pending_bookings = current_user.bookings.where(state: "pending")
    @user_paid_bookings = current_user.bookings.where(state: "paid")
    @user_refused_bookings = current_user.bookings.where(state: "refused")
  end

  def create

    @trip = Trip.create(departure_at: params['departure_date'].to_datetime,
                        arrival_at: params['arrival_date'].to_datetime,
                        duration: params['duration'],
                        individual_sncf_price_cents: params['individual_sncf_price_cents'],
                        individual_group_price_cents: params['individual_group_price_cents'],
                        station_departure: params['station_departure'],
                        station_arrival: params['station_arrival'],
                        train_number: params['train_number']
                      )
    @booking  = Booking.create!(trip: @trip, user: current_user)

    redirect_to bookings_path
  end

  def all
    @bookings = Booking.all
  end

  def destroy
    booking = current_user.bookings.find(params[:id])
    if booking.trip.bookings.count.to_i == 0
      booking.trip.destroy
      booking.destroy
      redirect_to bookings_path
    else
      booking.destroy
      redirect_to bookings_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
