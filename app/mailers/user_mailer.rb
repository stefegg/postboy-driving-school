class UserMailer < ApplicationMailer
  def app_email
    @student = Student.last
    mail(to: @student.email, subject: 'Thank you for your application!')
end
end
