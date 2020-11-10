class Api::V1::RoadtripsController < ApplicationController
  def create
    roadtrip_info = JSON.parse(request.raw_post, symbolize_names: true)
    lat_lng = MapFacade.lat_lng({location: roadtrip_info[:destination]})
    travel_info = MapFacade.travel_info(roadtrip_info)
    forecast = ForecastFacade.forecast(lat_lng)

    roadtrip = Roadtrip.new({ roadtrip: roadtrip_info, travel: travel_info, forecast: forecast})

    render json: RoadtripSerializer.new(roadtrip)
  end
end
