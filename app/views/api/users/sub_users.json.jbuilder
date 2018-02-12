json.status 0
json.message '获取成功'
json.data do
  json.users do
    json.array! @users do |user|
      json.id   user.id
      json.name user.username + user.name
      json.status user.status
    end
  end
end
