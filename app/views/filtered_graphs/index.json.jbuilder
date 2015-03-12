json.array!(@filtered_graphs) do |filtered_graph|
  json.extract! filtered_graph, :id, :graph_type_id, :dataset_type_id
  json.url filtered_graph_url(filtered_graph, format: :json)
end
