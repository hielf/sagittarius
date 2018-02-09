json.status 0
json.message 'ok'
json.data do
  json.user do
    json.id @user.id
    json.name @user.name
    json.username @user.username
    json.mobile @user.mobile
    json.role @user.role
    json.area @user.area_id? ? @user.area.city : "未指定"
    json.shop @user.shop_id? ? Shop.find(@user.shop_id).name : "未指定"
    json.team @user.team_id? ? Team.find(@user.team_id).name : "未指定"
    json.upper_user @user.upper_user_id? ? User.find(@user.upper_user_id).name : "未指定"
    json.upper_user_name @user.upper_user_name
    json.upper_user_phone @user.upper_user_phone
    json.upper_client @user.upper_client
    case @user.role
    when "staff"
      json.role "销售员"
    when "outworker"
      json.role "促销员"
    else
      json.role "管理员员"
    end
    json.team_members_count User.where(upper_user_id: @user.id).count
  end
end
