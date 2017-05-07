class PagesController < ApplicationController
  def home
  end

  def sms
    account_sid = "ACf2beac49077345a8175b6d4d56f24d9b"
    auth_token = "574f7f00532d9b0f598b2b57549705d3"
    
    begin
      @client = Twilio::REST::Client.new account_sid, auth_token
      @client.account.messages.create(:body => params[:message],
          :to => "+1#{params[:phone_number]}",
          :from => "+17744625181")
  
    rescue Twilio::REST::RequestError => e
      puts e.message
    end
  end
end
