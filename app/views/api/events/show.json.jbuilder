json.status 0
json.message 'ok'
json.data do
  json.event do
    json.id @event.id
    json.title @event.title
    json.image @event.image
    json.desc @event.desc
    json.begin_date @event.begin_date.strftime("%Y年%m月%d日")
    json.end_date @event.end_date.strftime("%Y年%m月%d日")
    json.status @event.status
    json.goods do
      json.array! @goods do |good|
        json.good_id good.id
        json.brand good.brand
        json.name good.name
        json.price good.price
        json.image good.image
      end
    end
  end
end
