class ForecastFacade
  def self.forecast(params)
    forecast = ForecastService.forecast(params)
    Forecast.new(forecast)
  end
end
