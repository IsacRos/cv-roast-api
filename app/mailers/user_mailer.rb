class UserMailer < Devise::Mailer
  default from: "isac.a.rosenberg@gmail.com"
  layout "mailer"

  def welcome_email
    @user = params[:user]
    @url = "http://localhost:4200/login"
    mail(to: @user.email, subject: "Welcome to CV Roast")
  end
end
