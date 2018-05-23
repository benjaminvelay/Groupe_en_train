require 'test_helper'

class BookingMailerTest < ActionMailer::TestCase
  test "confirmation" do
    mail = BookingMailer.confirmation
    assert_equal "Confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "succes" do
    mail = BookingMailer.succes
    assert_equal "Succes", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "echec" do
    mail = BookingMailer.echec
    assert_equal "Echec", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
