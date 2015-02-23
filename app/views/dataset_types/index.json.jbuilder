json.array!(@dataset_types) do |dataset_type|
  json.extract! dataset_type, :id, :name, :num_cols, :format
  json.url dataset_type_url(dataset_type, format: :json)
end
