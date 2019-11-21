class ContactMailer < ApplicationMailer

  #Sends an email:
  def contact_email(email, name, telephone, message)
    #Gets params from the form the user typed into:
    @email = email
    @name = name
    @telephone = telephone
    @message = message
    #Sends an email cced (carbon copied) to the user's email:
    mail cc: @email
  end

end
