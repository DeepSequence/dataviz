class AddDescriptionToDatasetType < ActiveRecord::Migration
  def change
    add_column :dataset_types, :description, :string
  end
end
