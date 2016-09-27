class TweetsController < ApplicationController

  def create
    params[:tweet][:to].each do |id|
      contact = Contact.find(id)
      @tweet = contact.tweets.new(tweet_params)
      if @tweet.save
        flash[:notice] = "Your tweet was sent"
      end
    end
    redirect_to messages_path
  end

private
  def tweet_params
    params.require(:tweet).permit(:text, :to)

  end
end
