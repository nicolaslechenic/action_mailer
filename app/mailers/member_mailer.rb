class MemberMailer < ApplicationMailer
  def welcome_email
    @member = params[:member]
    mail(to: @member.email, subject: 'Welcome to My Awesome Site')
  end

  def myapp_email
    @member = params[:member]
    mail(to: 'contact@myapp.com', subject: 'New contact')
  end
end
