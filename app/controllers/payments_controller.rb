class PaymentsController < ApplicationController
  before_action :set_trip

  def new
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @trip.groupe_price_per_user_cents_cents,
      description:  "Payment for trip #{@trip.departure_at} to #{@trip.arrival_at}  (#{@trip.id})",
      currency:     @trip.groupe_price_per_user_cents.currency
    )

    @booking.update(payment: charge.to_json, state: 'paid')
    redirect_to trip_booking_path(@trip)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_trip_booking_payment_path(@booking)
  end

private

  def set_trip
    @booking = current_user.bookings.where(state: 'pending').find(params[:booking_id])
  end
end
