require 'rails_helper'
require 'spec_helper'


describe Message, :vcr => true do
  it "doesn't sav the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => 'asdf', :from => '4156104770')
    expect(message.save).to eq(false)
  end

  it "adds an error if the number is invalid" do
    message = Message.new(:body => 'hi', :to => 'asdf', :from => '4156104770')
    message.save
    expect(message.errors[:base][0]).to eq("The 'To' number asdf is not a valid phone number.")
  end
end
