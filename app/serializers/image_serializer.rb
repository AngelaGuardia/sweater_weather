class ImageSerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil }
  attributes :location, :url, :credit
end
