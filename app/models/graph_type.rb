class GraphType < ActiveRecord::Base
  has_many :graphs
  has_many :filter_graphs
  has_many :dataset_types, through: :filtered_graphs
  validates_presence_of :name
end
