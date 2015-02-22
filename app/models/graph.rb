class Graph < ActiveRecord::Base
  belongs_to :dataset
  belongs_to :graph_type
end
