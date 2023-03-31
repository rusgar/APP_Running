require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  def setup
    @user = User.last
  end

  test "welcome" do
    mail = UserMailer.with(user: @user).welcome
    assert_equal "Bienvenido a Running para tod@s", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["no-reply@Running_for_everyone.com"], mail.from
    assert_match "Hey #{@user.username}, Bienvenid@ a Running para tod@s.", mail.body.encoded
  end
end
