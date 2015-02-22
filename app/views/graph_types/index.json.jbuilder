json.array!(@graph_types) do |graph_type|
  json.extract! graph_type, :id, :name
  json.url graph_type_url(graph_type, format: :json)
end
