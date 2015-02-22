class CreateGraphTypes < ActiveRecord::Migration
  def change
    create_table :graph_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
