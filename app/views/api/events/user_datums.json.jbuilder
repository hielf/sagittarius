json.status 0
json.message 'ok'
json.data do
  json.datums do
    json.array! @datums do |datum|
      json.datum_id datum.id
      json.event datum.event.title
      json.good datum.good.brand + datum.good.name
      json.good_price datum.good.price
      json.good_image datum.good.image.url
      json.in_num datum.in_num
      json.sell_num datum.sell_num
      json.storage_num datum.storage_num
      json.status datum.status
    end
  end
end
