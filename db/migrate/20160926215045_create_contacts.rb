class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.integer 'phone_number'
      t.string 'name'
    end
  end
end
