json.array!(@profanes) do |profane|
  json.extract! profane, :id, :text
  json.url profane_url(profane, format: :json)
end
