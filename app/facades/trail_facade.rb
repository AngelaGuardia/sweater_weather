class TrailFacade
  def self.trails_with_distance(trails_info, location)
    trails_info[:trails].map do |trail_info|
      trail = Trail.new(trail_info)
      distance = GeolocationService.directions(location, trail.location)[:route][:distance]
      trail.set_distance(distance)
      trail
    end
  end
end
