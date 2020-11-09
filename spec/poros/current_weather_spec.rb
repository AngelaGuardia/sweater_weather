require 'rails_helper'

describe CurrentWeather do
  it "exists and has attributes" do
    json = File.read('./spec/fixtures/denver_forecast.json')

    data = JSON.parse(json, symbolize_names: true)[:current]

    current_weather = CurrentWeather.new(data)

    expect(current_weather).to be_a(CurrentWeather)

    expect(current_weather.datetime).to be_a(Time)
    expect(current_weather.datetime).to eq('2020-11-08 12:04:34.000000000 -0800')

    expect(current_weather.sunrise).to be_a(Time)
    expect(current_weather.sunrise).to eq('2020-11-08 05:37:11.000000000 -0800')

    expect(current_weather.sunset).to be_a(Time)
    expect(current_weather.sunset).to eq('2020-11-08 15:50:18.000000000 -0800')

    expect(current_weather.temperature).to be_a(Float)
    expect(current_weather.temperature).to eq(56.93)

    expect(current_weather.feels_like).to be_a(Float)
    expect(current_weather.feels_like).to eq(40.89)

    expect(current_weather.humidity).to be_an(Integer)
    expect(current_weather.humidity).to eq(16)

    expect(current_weather.uvi).to be_a(Float)
    expect(current_weather.uvi).to eq(2.77)

    expect(current_weather.visibility).to be_an(Integer)
    expect(current_weather.visibility).to eq(10000)

    expect(current_weather.conditions).to be_a(String)
    expect(current_weather.conditions).to eq('few clouds')

    expect(current_weather.icon).to be_a(String)
    expect(current_weather.icon).to eq('02d')
  end
end
