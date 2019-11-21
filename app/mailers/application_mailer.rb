class ApplicationMailer < ActionMailer::Base
  default to: I18n.t('home.request_contact.site_email'), from: I18n.t('home.request_contact.site_email')
  layout 'mailer'
end
