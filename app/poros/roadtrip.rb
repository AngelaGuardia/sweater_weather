class Roadtrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta,
              :id

  def initialize(info)
    @id = nil
    @start_city = info[:roadtrip][:origin]
    @end_city = info[:roadtrip][:destination]
    @travel_time = info[:travel][:formatted_time]

    if info[:travel][:hours]
      hourly_forecast = info[:forecast].hourly_48_hours[info[:travel][:hours] - 1]
      @weather_at_eta = {
                          temperature: hourly_forecast.predicted_temp,
                          conditions: hourly_forecast.conditions
      }
    else
      @weather_at_eta = {}
    end
  end
end
