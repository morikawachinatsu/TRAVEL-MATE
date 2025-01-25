class AddStampsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :stamps, :integer
    add_column :users, :level, :integer
    add_column :users, :stamped_at, :datetime
  end
end
