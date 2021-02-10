class ForecastService
  def self.forecast(params)
    get_parsed_json('/data/2.5/onecall', params)
  end

  private

  def self.conn
    Faraday.new('https://api.openweathermap.org') do |faraday|
      faraday.params[:appid] = ENV['OPEN_WEATHER_API_KEY']
    end
  end

  def self.get_parsed_json(url, params)
    response = conn.get(url) do |req|
      req.params[:lat] = params[:lat_lng][:lat]
      req.params[:lon] = params[:lat_lng][:lng]
      req.params[:exclude] = 'minutely,alerts'
      if params[:units]
        req.params[:units] = params[:units]
      else
        req.params[:units] = 'imperial'
      end
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
