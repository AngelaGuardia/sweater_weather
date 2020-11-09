require 'rails_helper'

describe DailyWeather do
  it "exists and has attributes" do
    json = File.read('./spec/fixtures/denver_forecast.json')

    data = JSON.parse(json, symbolize_names: true)[:daily].first

    daily_weather = DailyWeather.new(data)

    expect(daily_weather).to be_a(DailyWeather)

    expect(daily_weather.date).to be_a(Time)
    expect(daily_weather.date).to eq('2020-11-08 10:00:00.000000000 -0800')

    expect(daily_weather.sunrise).to be_a(Time)
    expect(daily_weather.sunrise).to eq('2020-11-08 05:37:11.000000000 -0800')

    expect(daily_weather.sunset).to be_a(Time)
    expect(daily_weather.sunset).to eq('2020-11-08 15:50:18.000000000 -0800')

    expect(daily_weather.max_temp).to be_a(Float)
    expect(daily_weather.max_temp).to eq(57.74)

    expect(daily_weather.min_temp).to be_a(Float)
    expect(daily_weather.min_temp).to eq(48.61)

    expect(daily_weather.conditions).to be_a(String)
    expect(daily_weather.conditions).to eq('few clouds')

    expect(daily_weather.icon).to be_a(String)
    expect(daily_weather.icon).to eq('02d')
  end
end
