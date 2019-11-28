class HomeController < ApplicationController
  def home
  end

  def batters
    @batters = Player.all
  end

  def bowlers
    #TODO: Select only bowlers who have bowled in at least 1 Match
    # i.e. there is a bowling innings that belongs to them.

    #Best bowling should be the bowlers best performance:
    # firstly the greatest number of wickets, then the fewest
    # runs conceded (7 for 102 > 6 for 19, but 7 for 100 < 7 for 50)
    @bowlers = Player.all.where.not("bowlingstyle" => 0)
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
