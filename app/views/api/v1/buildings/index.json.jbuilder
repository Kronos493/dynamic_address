json.array!(@buildings) do |user|
  json.extract! building, :id, :name, :created_at, :updated_at
end