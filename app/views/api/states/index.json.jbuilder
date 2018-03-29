json.status 0
json.message 'ok'
json.data do
  json.me do
    json.user_id @user.id
    json.username @user.username
    json.name @user.name
    json.avatar @user.avatar
  end
  json.states do
    json.array! @states.each do |state|
      json.state_date state.created_at.strftime('%Y年%m月%d日')
      json.state_time state.created_at.strftime('%H:%M')
      json.note state.note
      json.comment state.comment
      json.state_status state.status
      case state.state_type
      when "tg"
        json.photo_type "地推"
      when "shelf"
        json.photo_type "货架"
      when "new"
        json.photo_type "新品"
      when "project"
        json.photo_type "项目"
      end
      json.photos do
        json.array! state.photos.each do |photo|
          json.photo_id photo.id
          json.order photo.order
          json.image photo.image
        end
      end
      json.count state.photos.count
      json.user do
        # json.array! do
          json.user_id state.user.id
          json.username state.user.username
          json.name state.user.name
          json.avatar state.user.avatar
        # end
      end
    end
  end
end
