class HikeSearch
  def initialize(trails_info, forecast, location)
    @location = location
    @forecast = set_forecast(forecast)
    @trails = set_trails(trails_info)
  end

  def set_forecast(forecast)
    {
      summary: forecast.current_weather.conditions,
      temperature: forecast.current_weather.temperature
    }
  end

  def set_trails(info)
    info[:trails].map { |trail| Trail.new(trail) }
  end
end
