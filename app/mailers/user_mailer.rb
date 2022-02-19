class UserMailer < ApplicationMailer
  default from: 'support@example.com'

  def user_created
    @user = User.last
    # @url  = 'localhost'
    mail(to: @user.email, subject: 'Confirm your email')
  end
end
