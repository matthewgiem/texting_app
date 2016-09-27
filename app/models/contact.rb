class Contact < ActiveRecord::Base
  validates_presence_of :phone_number, :name
  has_many :messages
end
