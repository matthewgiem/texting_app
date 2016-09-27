class MessagesController < ApplicationController

  def new
    @message = Message.new
    @numbers = [4156104770]
  end

  def create
    @numbers = [4156104770]
    params[:message][:to].each do |id|
      contact = Contact.find(id)
      @message = contact.messages.new(message_params)
      if @message.save
        flash[:notice] = "Your message was sent"
      end
    end
    redirect_to messages_path
  end

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

private
  def message_params
    params.require(:message).permit(:from, :body, :to)
  end
end
