json.array!(@datasets) do |dataset|
  json.extract! dataset, :id, :name, :file_name
  json.url dataset_url(dataset, format: :json)
end
