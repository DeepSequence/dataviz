class FixUserIdInGraphs < ActiveRecord::Migration
  def change
    #remove_column :users, :user_id, :integer
    add_column :graphs, :user_id, :integer
  end
end
