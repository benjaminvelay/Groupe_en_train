class BookingMailer < ApplicationMailer


  def confirmation(booking)
    @booking = booking
    @user = booking.user
    mail(to: @user.email, subject: 'A ticket has been chosen')
  end


  def succes(booking)
    @booking = booking
    @user = booking.user
    mail(to: @user.email, subject: 'Confirmation de votre voyage')
  end


  def echec(booking)
    @booking = booking
    @user = booking.user
    mail(to: @user.email, subject: 'Annulation de votre voyage')
  end
end
