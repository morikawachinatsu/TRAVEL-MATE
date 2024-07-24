class AddMapinfoToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :latitude, :float
    add_column :tweets, :longitude, :float
  end
end
