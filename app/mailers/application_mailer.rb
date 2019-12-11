class ApplicationMailer < ActionMailer::Base
  #Default sending from and to the site email (Mailer will CC emails to the user)
  default to: I18n.t('home.request_contact.site_email'), from: I18n.t('home.request_contact.site_email')
  layout 'mailer'
end
