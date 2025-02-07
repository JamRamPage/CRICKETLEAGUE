class HomeController < ApplicationController
  def home
  end

  def batters
    #We sort the batters according to the total runs they have scored
    @batters = Player.all.sort {|player1, player2| player2.totalRunsBatted.to_i <=> player1.totalRunsBatted.to_i}
  end

  def bowlers
    #We sort the bowlers according to the total wickets they have taken
    @bowlers = Player.bowlers.sort_by {|player| [-player.totalWickets.to_i, if player.totalRunsConceded == "" then 999999999999 else player.totalRunsConceded.to_i end]}
  end

  def contact
  end

  #Used to send emails:
  def request_contact
    #Gets form values that user has typed in:
    name = contact_params["name"]
    email = contact_params["email"]
    telephone = contact_params["telephone"]
    message = contact_params["message"]

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

  private

    #Only permit these parameters for an email request
    def contact_params
      params.permit(:name, :email, :telephone, :message)
    end
end
