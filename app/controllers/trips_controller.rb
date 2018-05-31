require 'date'
class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @booking_trips = []
    @station_departure = params['search']['station_departure']
    @station_arrival = params['search']['station_arrival']

    if params['search']['departure_at'] == ""
        bookings = Booking.all
        @bookings = bookings.select { |booking| booking.trip.bookings.count.to_i >= 6}
        flash.now[:alert] = "Veuillez rentrer une date de départ."
        render "pages/home"
    else
      raw_date_input = Date.strptime(params['search']['departure_at'], '%Y-%m-%d')
      raw_date = raw_date_input.strftime("%Y-%m-%d")
      trip_date = (raw_date_input.to_time.to_i.to_s + "000").to_i


      @trips = ProposedTrip.search(@station_departure, @station_arrival, trip_date, raw_date)
      @api_trips = @trips.select{|trip| trip.departure_date.day == Time.zone.parse(params['search']['departure_at']).day }
      @db_trips = Trip.all


      @api_trips.each do |api_trip|
        booking_trip = @db_trips.find_by(train_number: api_trip.train_number)

        if booking_trip
          @api_trips.delete(api_trip)
          @booking_trips << booking_trip
        end
      end

      if @api_trips.empty?
        bookings = Booking.all
        @bookings = bookings.select { |booking| booking.trip.bookings.count.to_i >= 6}
        flash.now[:alert] = "Aucun billets existants ou nom de gare erroné."
        render "pages/home"
      end
    end
  end
  def show
    if params[:id].to_i.zero?
      @trip = Trip.new(departure_at: params['departure_date'], arrival_at: params['arrival_date'], duration: params['duration'], individual_sncf_price_cents: params['individual_sncf_price_cents'], individual_group_price_cents: params['individual_group_price_cents'], station_departure: params['station_departure'], station_arrival: params['station_arrival'], train_number: params['train_number'])
    else
      @trip = Trip.find(params[:id])
    end
  end
end

