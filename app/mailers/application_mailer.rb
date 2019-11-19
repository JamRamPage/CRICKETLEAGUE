class ApplicationMailer < ActionMailer::Base
  default to: 'support@cricketleagues.com', from: 'support@cricketleagues.com'
  layout 'mailer'
end
