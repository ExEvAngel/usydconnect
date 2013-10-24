class Email < ActionMailer::Base
  default from: "system@example.com"
  
  def signup_verification(@user, @code)
    mail(to: @user.email, subject: "Usydconnect Verification")
  end
end
