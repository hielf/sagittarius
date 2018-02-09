json.status 0
json.message '获取成功'
json.data do
  json.teams do
    json.array! @teams do |team|
      json.id   team.id
      json.name team.code + "-" + team.name
    end
  end
end
