class RoadtripFacade
  def self.trip(roadtrip_info)
    lat_lng = MapService.lat_lng({location: roadtrip_info[:destination]})
    travel_info = MapService.travel_info(roadtrip_info)
    forecast = ForecastFacade.forecast({lat_lng: lat_lng, units: roadtrip_info[:units]}) if travel_info[:hours]

    Roadtrip.new({ roadtrip: roadtrip_info, travel: travel_info, forecast: forecast})
  end
end
