class UserMailer < ApplicationMailer

  def welcome_email(user)
     @user = user
     mail(to: @user.email, subject: 'Welcome to Mement-oh')
  end

  def new_user_invite(invite, path)
    @invite = invite
    @path = path
    #rest of code here
  end

end
