class Api::V1::TrailsController < ApplicationController
  def index
    lat_lng = GeolocationFacade.lat_lng(params)
    forecast = ForecastFacade.forecast(lat_lng)

    conn = Faraday.new('https://www.hikingproject.com')

    response = conn.get('/data/get-trails') do |req|
      req.params[:key] = ENV['HIKE_API_KEY']
      req.params[:lat] = lat_lng[:lat]
      req.params[:lon] = lat_lng[:lng]
    end

    trails_info = JSON.parse(response.body, symbolize_names: true)

    hike_search = HikeSearch.new(trails_info, forecast, params[:location])
    render json: HikeSearchSerializer.new(hike_search)
  end
end
