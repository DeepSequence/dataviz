class CreateGraphs < ActiveRecord::Migration
  def change
    create_table :graphs do |t|
      t.string :name
      t.references :dataset, index: true
      t.references :graph_type, index: true

      t.timestamps null: false
    end
    add_foreign_key :graphs, :datasets
    add_foreign_key :graphs, :graph_types
  end
end
