require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "should return contact email" do
    mail = ContactMailer.contact_email("support@cricketleagues.com", "James Page", "01234567890", @message = "DUMMY")
    assert_equal ['support@cricketleagues.com'], mail.to
    assert_equal ['support@cricketleagues.com'], mail.from
  end
end
