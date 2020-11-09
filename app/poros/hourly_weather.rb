class HourlyWeather
  attr_reader :time,
              :wind_speed,
              :wind_direction,
              :conditions,
              :icon

  def initialize(data)
    @time = Time.at(data[:dt]).strftime('%H:%M:%S')
    @wind_speed = data[:wind_speed]
    @wind_direction = data[:wind_deg]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end
end
