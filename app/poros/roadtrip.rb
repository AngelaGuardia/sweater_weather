class Roadtrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(info)
    @start_city = info[:roadtrip][:origin]
    @end_city = info[:roadtrip][:destination]
    @travel_time = info[:travel][:formatted_time]
    @weather_at_eta = set_weather(info)
  end

  def set_weather(info)
    if info[:travel][:hours]
      hourly_forecast = info[:forecast].hourly_48_hours[info[:travel][:hours] - 1]
      {
        temperature: hourly_forecast.predicted_temp,
        conditions: hourly_forecast.conditions
      }
    else
      {}
    end
  end
end
