json.status 0
json.message 'ok'
json.data do
  json.user do
    json.(@current_user, :id, :name, :username, :station_id, :role)
    json.station_name @current_user.station.name
  end
end