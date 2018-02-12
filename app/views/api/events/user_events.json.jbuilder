json.status 0
json.message 'ok'
json.data do
  json.events do
    json.array! @events do |event|
      json.event_id event.id
      json.user_id @user.id
      json.title event.title
      json.image event.image.url
      json.desc event.desc
      json.status event.status
      json.begin_date event.begin_date.strftime("%Y年%m月%d日")
      json.end_date event.end_date.strftime("%Y年%m月%d日")
    end
  end
end
