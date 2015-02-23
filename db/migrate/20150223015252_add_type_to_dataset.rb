class AddTypeToDataset < ActiveRecord::Migration
  def change

    add_column :datasets, :dataset_type_id, :integer
  end
end
