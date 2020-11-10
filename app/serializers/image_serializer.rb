class ImageSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :location, :url, :credit
end
