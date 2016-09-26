class EditContacts < ActiveRecord::Migration[5.0]
  def change
    remove_column(:contacts, :phone_number)
    add_column(:contacts, :phone_number, :string)
  end
end
