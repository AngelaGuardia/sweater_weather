class HourlyWeather
  attr_reader :time,
              :predicted_temp,
              :wind_speed,
              :wind_direction,
              :conditions,
              :icon

  def initialize(data)
    @time = Time.at(data[:dt]).strftime('%H:%M:%S')
    @predicted_temp = data[:temp]
    @wind_speed = data[:wind_speed]
    @wind_direction = data[:wind_deg]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end

  # TODO: When ran locally, the time Time.at reflects the local time of the computer running it. However the hosted app must be displaying the local time of the heroku server
end
