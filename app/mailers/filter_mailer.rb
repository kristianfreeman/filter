class FilterMailer < ActionMailer::Base
  include Resque::Mailer
  default from: "kristian@usefilter.com"

  def gave_email(email)
    @email = email
    @help = help_url
    mail(to: @email, subject: 'Thanks for joining Filter!')
  end
end