class ForecastFacade
  def self.forecast(lat_lng)
    forecast_new(ForecastService.forecast(lat_lng))
  end

  def self.forecast_new(forecast)
    Forecast.new(forecast)
  end
end
