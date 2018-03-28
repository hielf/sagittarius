json.status 0
json.message '获取成功'
json.data do
  json.users do
    json.array! @users do |user|
      json.id   user.id
      json.fullname user.username + "-" + user.name
      json.username user.username
      json.name user.name
      json.mobile user.mobile
      json.status user.status
      json.short Spinying.parse(:word => user.name).first.upcase
      json.update_date User.last.updated_at.strftime('%Y年%m月%d日')
      json.shop user.shop_id.nil? ? "" : Shop.find_by(id: user.shop_id).name
    end
  end
end
