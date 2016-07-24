json.array!(@stations) do |station|
  json.extract! station, :id, :program_id, :sequence, :duration
  json.url station_url(station, format: :json)
end
