class Dataset < ActiveRecord::Base
  has_many :graphs
  belongs_to :user
  belongs_to :dataset_type
  has_attached_file :data_file
  validates_attachment_content_type :data_file, :content_type => "text/tab-separated-values"
  validates_presence_of :name
  validates_presence_of :dataset_type_id
  validates_uniqueness_of :name

  #get an enhanced name that shows the types of graphs that dataset supports
  def supported_graph_types
    #grab the linked graph types through the filtered_graphs association of the dataset_type
    name + " (" + dataset_type.graph_types.collect{|x| x.name}.join(", ") +")"
  end
end
