class UserMailer < ApplicationMailer

  def welcome_email(user)
     @user = user
     mail(to: @user.email, subject: 'Welcome to Mement-oh')
  end

  def share_memento_email(user, recipient, url)
     @user = user
     @recipient = recipient
     @url = url
     mail(to: @recipient.email, subject: "#{@user.name} wants to share a Mement-oh with you.")
  end
end
