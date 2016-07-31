json.array!(@ports) do |port|
  json.extract! port, :id, :pin_id, :gpio, :port_number
  json.url port_url(port, format: :json)
end
