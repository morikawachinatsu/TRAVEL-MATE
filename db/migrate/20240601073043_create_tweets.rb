class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :name
      t.string :address
      t.time :opentime
      t.time :endtime
      t.string :dayoff
      t.string :peaktime
      t.string :access

      t.timestamps
    end
  end
end
