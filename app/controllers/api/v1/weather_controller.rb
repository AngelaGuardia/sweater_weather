class Api::V1::WeatherController < ApplicationController
  def index
    # conn = Faraday.new('http://www.mapquestapi.com')
    #
    # response = conn.get('/geocoding/v1/address') do |req|
    #   req.params[:key] = ENV['MAPQUEST_API_KEY']
    #   req.params[:location] = params[:location]
    #   req.params[:maxResults] = 1
    # end
    #
    # parsed_json = JSON.parse(response.body, symbolize_names: true)
    # lat_lng = parsed_json[:results].first[:locations].first[:latLng]

    lat_lng = GeolocationFacade.lat_lng(params)

    conn = Faraday.new('https://api.openweathermap.org')

    response = conn.get('/data/2.5/onecall') do |req|
      req.params[:appid] = ENV['OPEN_WEATHER_API_KEY']
      req.params[:lat] = lat_lng[:lat]
      req.params[:lon] = lat_lng[:lng]
      req.params[:exclude] = 'minutely,alerts'
      req.params[:units] = 'imperial'
    end

    parsed_json = JSON.parse(response.body, symbolize_names: true)

    render json: ForecastSerializer.new(Forecast.new(parsed_json))
  end
end
