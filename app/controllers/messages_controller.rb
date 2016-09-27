class MessagesController < ApplicationController

  def new
    @message = Message.new
    @numbers = [4156104770]
    @contacts = Contact.all.map {|contact| [contact.name, contact.phone_number]}
  end

  def create
    @numbers = [4156104770]
    @contacts = Contact.all.map {|contact| [contact.name, contact.phone_number]}
    binding.pry
    params[:message][:to].each do |number|
      @message = Message.new(message_params)
      @message[:to] = number
      if @message.save
        flash[:notice] = "Your message was sent"
      end
      # else
      #   render 'new'
      # end
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
    params.require(:message).permit(:from, :body)
  end
end
