class Api::V1::WeatherController < ApplicationController
  def index
    lat_lng = GeolocationFacade.lat_lng(params)

    render json: ForecastSerializer.new(ForecastFacade.forecast(lat_lng))
  end
end
