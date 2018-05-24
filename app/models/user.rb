class User < ApplicationRecord
  has_many :trips
  has_many :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :send_welcome_mail

  private

  def send_welcome_mail
    UserMailer.welcome(self).deliver_now
  end
end
