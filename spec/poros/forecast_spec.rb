require 'rails_helper'

describe Forecast do
  it "exists and has attributes" do
    data = File.read('./spec/fixtures/denver_forecast.json')
    forecast_data = JSON.parse(data, symbolize_names: true)

    forecast = Forecast.new(forecast_data)

    expect(forecast).to be_a(Forecast)
    expect(forecast.current_weather).to be_a(CurrentWeather)
    expect(forecast.daily_weather).to be_an(Array)
    expect(forecast.daily_weather.size).to eq(5)
    expect(forecast.daily_weather.first).to be_a(DailyWeather)
    expect(forecast.hourly_weather).to be_an(Array)
    expect(forecast.hourly_weather.size).to eq(8)
    expect(forecast.hourly_weather.first).to be_a(HourlyWeather)
    expect(forecast.hourly_48_hours).to be_an(Array)
    expect(forecast.hourly_48_hours.size).to eq(48)
    expect(forecast.hourly_48_hours.first).to be_a(HourlyWeather)
  end
end
