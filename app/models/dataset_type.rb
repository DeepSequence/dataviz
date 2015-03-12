class DatasetType < ActiveRecord::Base
  has_many :datasets
  has_many :filtered_graphs
  has_many :graph_types, through: :filtered_graphs
  validates_presence_of :name
end
