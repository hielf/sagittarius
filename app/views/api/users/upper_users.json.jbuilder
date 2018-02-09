json.status 0
json.message '获取成功'
json.data do
  json.upper_users do
    json.array! @upper_users do |upper_user|
      json.id   upper_user.id
      json.name upper_user.username + "-" + upper_user.name
    end
  end
end
