class Message < ActiveRecord::Base
  before_create :send_message

private

  def send_message
    response = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/AC71a7982ab5d7a322a2cf3607cd05e8e2/Messages.json',
      :user => 'AC71a7982ab5d7a322a2cf3607cd05e8e2',
      :password => '4bde80e20747c855c0bd8b04d4fde1f4',
      :payload => { :Body => body,
                    :From => from,
                    :To => to }
    ).execute
  end
end
