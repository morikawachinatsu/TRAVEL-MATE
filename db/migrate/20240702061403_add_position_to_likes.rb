class AddPositionToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :position, :integer
  end
end
