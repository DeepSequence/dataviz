class FilteredGraph < ActiveRecord::Base
  belongs_to :graph_type
  belongs_to :dataset_type
  validates_presence_of :graph_type_id
  validates_presence_of :dataset_type_id
end
