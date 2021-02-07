class Forecast
  attr_reader :current_weather,
              :daily_weather,
              :hourly_weather,
              :hourly_48_hours

  def initialize(data)
    @current_weather = CurrentWeather.new(data[:current])
    @daily_weather = data[:daily][0..4].map { |day| DailyWeather.new(day) }
    @hourly_48_hours = data[:hourly].map { |hour| HourlyWeather.new(hour) }
    @hourly_weather = @hourly_48_hours.first(8)
  end
end
