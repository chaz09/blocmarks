ActionMailer::Base.smtp_settings = {
  port:              587,
  address:           'smtp.mailgun.org',
  user_name:         ENV['MAILGUN_SMTP_LOGIN'],
  password:          ENV['MAILGUN_SMTP_PASSWORD'],
  domain:            '',
  authentication:    :plain,
  content_type:      'text/html'
}
ActionMailer::Base.delivery_method = :smtp

# Makes debugging *way* easier.
ActionMailer::Base.raise_delivery_errors = true

# This interceptor just makes sure that local mail
# only emails you.
# http://edgeguides.rubyonrails.org/action_mailer_basics.html#intercepting-emails
