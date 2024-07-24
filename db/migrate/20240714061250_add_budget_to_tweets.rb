class AddBudgetToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :budget, :string
  end
end
