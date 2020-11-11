class RoadtripFacade
  def self.trip(roadtrip_info)
    lat_lng = MapFacade.lat_lng({location: roadtrip_info[:destination]})
    travel_info = MapFacade.travel_info(roadtrip_info)
    forecast = ForecastFacade.forecast(lat_lng)

    roadtrip = Roadtrip.new({ roadtrip: roadtrip_info, travel: travel_info, forecast: forecast})
  end
end
