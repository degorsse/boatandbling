json.array!(@boats) do |boat|
  json.extract! boat, :id, :name, :capacity, :size, :price_per_day, :description
  json.url boat_url(boat, format: :json)
end
