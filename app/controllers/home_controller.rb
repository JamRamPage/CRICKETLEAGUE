class HomeController < ApplicationController
  def home
  end

  def contact
  end

  #Used to send emails:
  def request_contact
    #Gets form values that user has typed in:
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]

    #If user has not typed in an email, alert them that
    #they should type one in:
    if email.blank?
      flash[:alert] = I18n.t('home.request_contact.no_email')
    else
      #Send an email:
      ContactMailer.contact_email(email, name, telephone, message).deliver_now
      flash[:notice] = I18n.t('home.request_contact.email_sent')
    end
    #Go back to home page, where the appropriate prompt will be shown:
    redirect_to root_path
  end
end
