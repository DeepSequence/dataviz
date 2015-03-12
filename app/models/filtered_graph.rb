class FilteredGraph < ActiveRecord::Base
  belongs_to :graph_type
  belongs_to :dataset_type
end
