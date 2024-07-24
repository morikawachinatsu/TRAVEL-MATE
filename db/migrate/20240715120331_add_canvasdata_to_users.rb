class AddCanvasdataToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :canvasdata, :text
  end
end
