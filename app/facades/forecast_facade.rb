class ForecastFacade
  def self.forecast(params)
    forecast_new(ForecastService.forecast(params))
  end

  def self.forecast_new(forecast)
    Forecast.new(forecast)
  end
end

# TODO: I think the forecast_new method here is unnecessary, I typically like having it for situations where the facade is creating multiple objects but that is not the case here.

# TODO: This entire facase may not be needed
