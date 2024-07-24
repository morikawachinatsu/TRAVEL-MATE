class AddCustomTimeToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :custom_time, :string
  end
end
