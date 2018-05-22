class TripsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @trips = Trip.all
  end
end
