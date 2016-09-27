class Tweet < ActiveRecord::Base
  belongs_to :contact
  before_create :send_tweet

  def get_cat_fact
    response = RestClient::Request.new(
    :method => :get,
    :url => 'http://catfacts-api.appspot.com/api/facts?number=1'
    ).execute
  end

  def send_tweet
    begin
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
      end
      cat_response = JSON.parse(get_cat_fact)
      fact = cat_response["facts"][0]
      client.update("@#{contact.twitter_handle} " + fact)
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)["message"]
      errors.add(:base, message)
      throw(:abort)
    end
  end
end
