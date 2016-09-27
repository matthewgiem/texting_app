class Message < ActiveRecord::Base
  before_create :send_message
  belongs_to :contact

private

  def send_message
    begin
      binding.pry
      response = RestClient::Request.new(
        :method => :post,
        :url => 'https://api.twilio.com/2010-04-01/Accounts/AC71a7982ab5d7a322a2cf3607cd05e8e2/Messages.json',
        :user => ENV['TWILIO_ACCOUNT_SID'],
        :password => ENV['TWILIO_AUTH_TOKEN'],
        :payload => { :Body => body,
                      :From => from,
                      :To => contact.phone_number }
      ).execute
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)["message"]
      errors.add(:base, message)
      throw(:abort)
    end
  end
end
