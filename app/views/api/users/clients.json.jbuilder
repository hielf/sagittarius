json.status 0
json.message '获取成功'
json.data do
  json.clients do
    json.array! @clients do |client|
      json.id   client.id
      json.name client.name
    end
  end
end
