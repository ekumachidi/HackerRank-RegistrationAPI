class UserMailer < ApplicationMailer
  default from: 'registration@hackerrank.com', reply_to: 'admin@hackerrank.com', bcc: 'admin@hackerrank.com'

  def registration_confirmation(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to HackerRank!')
  end
end
