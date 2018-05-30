class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    bookings = Booking.all
    @bookings = bookings.select { |booking| booking.trip.bookings.count.to_i >= 6}
  end
end
