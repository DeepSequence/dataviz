class AddImageToDatasetType < ActiveRecord::Migration
  def change
    add_column :dataset_types, :image_file, :string
  end
end
