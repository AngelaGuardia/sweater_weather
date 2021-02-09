class Api::V1::WeatherController < ApplicationController
  def index
    lat_lng = MapFacade.lat_lng(params)
    if lat_lng
      render json: ForecastSerializer.new(ForecastFacade.forecast({lat_lng: lat_lng, units: params[:units]}))
    else
      render json: { errors: 'Location not found' }.to_json, status: :bad_request
    end
  end
end
# TODO: add private params?
