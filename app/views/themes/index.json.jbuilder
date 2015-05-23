json.array!(@themes) do |theme|
  json.extract! theme, :id, :title, :background, :navbar
  json.url theme_url(theme, format: :json)
end
