class MessagesController < ApplicationController

  def new
    @message = Message.new
    @numbers = [4156104770]
    @contacts = [4155900939]
  end

  def create
    @numbers = [4156104770]
    @contacts = [4155900939]
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Your message was sent"
      redirect_to messages_path
    else
      binding.pry
      render 'new'
    end
  end

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

private
  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
