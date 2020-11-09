class HikeSearchSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  set_type :trail
  attributes :location, :forecast, :trails
end
