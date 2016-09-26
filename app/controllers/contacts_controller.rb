class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Your contact was saved"
      redirect_to messages_path
    else
      render 'new'
    end
  end

private
  def contact_params
    params.require(:contact).permit(:phone_number, :name)
  end
end
