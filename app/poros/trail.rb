class Trail
  attr_reader :name,
              :summary,
              :difficulty,
              :location,
              :distance_to_trail

  def initialize(data)
    @name = data[:name]
    @summary = data[:summary]
    @difficulty = data[:difficulty]
    @location = data[:location]
  end

  def set_distance(miles)
    @distance_to_trail = miles
  end
end
