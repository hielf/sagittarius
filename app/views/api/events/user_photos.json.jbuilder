json.status 0
json.message 'ok'
json.data do
  json.serials do
    json.array! @photos.group_by(&:serial_code, &:status).each do |serial_code, ps|
      json.photos do
        @photos.where(serial_code: serial_code).each do |photo|
          json.photo_id photo.id
          json.order  photo.order
          json.image photo.image
        end
      end
      json.count ps.count
      json.serial_code = serial_code
      json.status = ps.last["status"]
    end
  end
end
#
# @photos.group_by(&:serial_code).each do |serial_code, ps|
#   @photos.where(serial_code: serial_code).each do |photo|
#     p photo.id
#   end
#   p ps.count
#   p serial_code
#   p ps.last["status"]
# end;0
