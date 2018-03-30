json.status 0
json.message 'ok'
json.data do
  json.events do
    json.event_type @event_type
    json.current_time Time.now.strftime('%Y年%m月%d日 %H:%M:%S')
    json.array! @events.each do |event|
      json.id event.id
      json.title event.title
      json.desc event.desc
      json.begin_date event.begin_date.strftime('%Y年%m月%d日')
      json.end_date event.end_date.strftime('%Y年%m月%d日')
      json.status event.status
      json.image event.image.url
      case event.event_type
      when "tg"
        json.event_type "地推"
      when "shelf"
        json.event_type "货架"
      when "new"
        json.event_type "新品"
      when "project"
        json.event_type "项目"
      end
    end
  end
end
