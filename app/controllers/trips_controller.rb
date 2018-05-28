require 'date'
class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @available_bookings = Trip.joins(:bookings).where(bookings: {state: "pending"}).uniq
    @station_departure = params['search']['station_departure']
    @station_arrival = params['search']['station_arrival']
    raw_date = params['search']['departure_at']
    temp_date = (Time.zone.parse(params['search']['departure_at'])).to_i
    trip_date = (temp_date.to_s + "000").to_i
    @trips = ProposedTrip.search(@station_departure, @station_arrival, trip_date, raw_date)
    @trips = @trips.select{|trip| trip.departure_date.day == Time.zone.parse(params['search']['departure_at']).day }
    if @trips.empty?
      flash[:alert] = "Aucun billets existants ou nom de gare erroné."
      render "pages/home"
    else
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end
end

