json.array!(@graphs) do |graph|
  json.extract! graph, :id, :name, :dataset_id, :graph_type_id
  json.url graph_url(graph, format: :json)
end
