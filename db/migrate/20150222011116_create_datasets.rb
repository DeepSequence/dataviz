class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :name
      t.string :file_name

      t.timestamps null: false
    end
  end
end
