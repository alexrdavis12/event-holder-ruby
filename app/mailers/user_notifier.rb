class UserNotifier < ApplicationMailer
	default :from => 'bcsmagi@yahoo.com'

  # send a signup email to the user, pass in the user object that contains the user's email address
  def send_signup_email(user)
    @user = user
    @url  = 'http://magi-csujedihy.c9users.io/login'
    mail( :to => @user.email,
    :subject => 'Thanks for signing up American G.I. Events' )
  end
end
