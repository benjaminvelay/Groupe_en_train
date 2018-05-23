# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/confirmation
  def confirmation
    booking = Booking.first
    BookingMailer.confirmation(booking)
  end

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/succes
  def succes
    booking = Booking.first
    BookingMailer.succes(booking)
  end

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/echec
  def echec
    booking = Booking.first
    BookingMailer.echec(booking)
  end

end
