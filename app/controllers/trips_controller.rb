require 'date'
class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    station_departure = params['search']['station_departure']
    station_arrival = params['search']['station_arrival']
    temp_date = (Time.zone.parse(params['search']['departure_at'])).to_i
    trip_date = (temp_date.to_s + "000").to_i
    @trips = ProposedTrip.search(station_departure, station_arrival, trip_date)
    @trips = @trips.select{|trip| trip.departure_date.day == Time.zone.parse(params['search']['departure_at']).day }
    if @trips.empty?
      flash[:alert] = "Please review your search inputs."
      render "pages/home"
    else
    end
  end

  def show
    @trip = Trip.new(departure_at: params['departure_date'], arrival_at: params['arrival_date'], duration: params['duration'], individual_sncf_price_cents: params['individual_sncf_price_cents'], individual_group_price_cents: params['individual_group_price_cents'], station_departure: params['departure_station'], station_arrival: params['arrival_station'])
  end
end

