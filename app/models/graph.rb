class Graph < ActiveRecord::Base
  belongs_to :dataset
  belongs_to :graph_type
  belongs_to :user
  validates_presence_of :name
  validates_presence_of :graph_type_id
  validates_presence_of :dataset_id

end
