class CreateDatasetTypes < ActiveRecord::Migration
  def change
    create_table :dataset_types do |t|
      t.string :name
      t.integer :num_cols
      t.string :format

      t.timestamps null: false
    end
  end
end
