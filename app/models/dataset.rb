class Dataset < ActiveRecord::Base
  has_many :graphs
  belongs_to :user
  belongs_to :dataset_type
  has_attached_file :data_file
  validates_attachment_content_type :data_file, :content_type => "text/tab-separated-values"
end
