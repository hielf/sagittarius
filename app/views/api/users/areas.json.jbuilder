json.status 0
json.message '获取成功'
json.data do
  json.areas do
    json.array! @areas do |area|
      json.id   area.id
      json.name area.city
    end
  end
end
