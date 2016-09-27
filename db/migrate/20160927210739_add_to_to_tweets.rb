class AddToToTweets < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :to, :string
  end
end
