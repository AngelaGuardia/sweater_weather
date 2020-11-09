class Forecast
  attr_reader :current_weather, :daily_weather, :hourly_weather, :id

  def initialize(data)
    @current_weather = CurrentWeather.new(data[:current])
    @daily_weather = set_daily(data[:daily]).first(5)
    @hourly_weather = set_hourly(data[:hourly]).first(8)
    @id = nil
  end

  def set_daily(days)
    days.map { |day| DailyWeather.new(day) }
  end

  def set_hourly(hours)
    hours.map { |hour|  HourlyWeather.new(hour) }
  end
end
