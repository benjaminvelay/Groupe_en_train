class Booking < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  after_create :send_confirmation_mail
  enum state: [:pending, :paid, :refused]
  validates :trip_id, presence: true


  def deadline
    trip.departure_at.ago(7.days)
  end

  def remaining_seconds
    (deadline - DateTime.now).to_i
  end

  private

  def send_confirmation_mail
    BookingMailer.confirmation(self).deliver_now
  end

end
