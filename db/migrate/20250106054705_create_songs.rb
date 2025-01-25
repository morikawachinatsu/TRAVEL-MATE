class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.text :body
      t.text :apple

      t.timestamps
    end
  end
end
