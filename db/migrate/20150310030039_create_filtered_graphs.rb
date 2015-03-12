class CreateFilteredGraphs < ActiveRecord::Migration
  def change
    create_table :filtered_graphs do |t|
      t.references :graph_type, index: true
      t.references :dataset_type, index: true

      t.timestamps null: false
    end
    add_foreign_key :filtered_graphs, :graph_types
    add_foreign_key :filtered_graphs, :dataset_types
  end
end
