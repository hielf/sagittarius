json.status 0
json.message '获取成功'
json.data do
  json.shops do
    json.array! @shops do |shop|
      json.id   shop.id
      json.name shop.name
    end
  end
end
