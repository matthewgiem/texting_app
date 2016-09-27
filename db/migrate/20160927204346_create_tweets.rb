class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :text
      t.integer :contact_id
    end

    add_column :contacts, :twitter_handle, :string
  end
end
