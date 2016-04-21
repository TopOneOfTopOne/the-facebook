class Users < ApplicationMailer
  def welcome_email(user)
    @user = user
    user_email_with_name = %("#{@user.name}" <#{@user.email}>)
    mail(
        to: user_email_with_name, subject: 'Welcome to Facebook'
    )
  end
end
