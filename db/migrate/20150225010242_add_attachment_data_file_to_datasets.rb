class AddAttachmentDataFileToDatasets < ActiveRecord::Migration
  def self.up
    change_table :datasets do |t|
      t.attachment :data_file
    end
  end

  def self.down
    remove_attachment :datasets, :data_file
  end
end
