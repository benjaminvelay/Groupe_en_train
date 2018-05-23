class Booking < ApplicationRecord
  belongs_to :trip
  belongs_to :user

  after_create :send_confirmation_mail

  private

  def send_confirmation_mail
    BookingMailer.confirmation(self).deliver_now
  end

end
