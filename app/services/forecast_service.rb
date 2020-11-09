class ForecastService
  def self.forecast(lat_lng)
    get_parsed_json('/data/2.5/onecall', lat_lng)
  end

  def self.get_parsed_json(url, lat_lng)
    response = conn.get(url) do |req|
      req.params[:appid] = ENV['OPEN_WEATHER_API_KEY']
      req.params[:lat] = lat_lng[:lat]
      req.params[:lon] = lat_lng[:lng]
      req.params[:exclude] = 'minutely,alerts'
      req.params[:units] = 'imperial'
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new('https://api.openweathermap.org')
  end
end
