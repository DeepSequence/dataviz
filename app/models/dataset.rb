class Dataset < ActiveRecord::Base
  has_many :graphs
  belongs_to :dataset_type
end
