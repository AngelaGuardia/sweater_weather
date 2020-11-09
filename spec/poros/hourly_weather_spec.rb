require 'rails_helper'

describe HourlyWeather do
  it "exists and has attributes" do
    json = File.read('./spec/fixtures/denver_forecast.json')

    data = JSON.parse(json, symbolize_names: true)[:hourly].first

    hourly_weather = HourlyWeather.new(data)

    expect(hourly_weather).to be_a(HourlyWeather)

    expect(hourly_weather.time).to be_a(String)
    expect(hourly_weather.time).to eq("12:00:00")

    expect(hourly_weather.predicted_temp).to be_a(Float)
    expect(hourly_weather.predicted_temp).to eq(56.93)

    expect(hourly_weather.wind_speed).to be_a(Float)
    expect(hourly_weather.wind_speed).to eq(15.3)

    expect(hourly_weather.wind_direction).to be_a(Integer)
    expect(hourly_weather.wind_direction).to eq(199)

    expect(hourly_weather.conditions).to be_a(String)
    expect(hourly_weather.conditions).to eq('few clouds')

    expect(hourly_weather.icon).to be_a(String)
    expect(hourly_weather.icon).to eq('02d')

  end
end
