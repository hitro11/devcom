class ContaactMailer < ActionMailer::Base
  default to 'rohitnazareth07@gmail.com'
  
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
    
    mail (from: email, subject: 'DevMatch Contact Form')
end