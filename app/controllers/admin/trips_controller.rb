class Admin::TripsController < ApplicationController
before_action :authenticate_admin!

  def index
    @trips =  Trip.joins(:bookings).where(bookings: {state: "pending"})

  end

  def update
  end


  private

  def authenticate_admin!
    if !current_user.admin
      redirect_to home_path and return
    end

  end
end
