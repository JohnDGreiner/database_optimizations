class AssemblyMailer < ApplicationMailer

  def send_an_email(email)
    mail(to: email, subject: "welcome")
  end
  
end
