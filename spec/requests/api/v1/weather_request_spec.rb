require 'rails_helper'

describe 'Weather request' do
  it "returns weather for a city" do
    VCR.use_cassette('denver_forecast_2') do
      get '/api/v1/forecast?location=denver,co'
      expect(response).to be_successful

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast).to be_a(Hash)
      expect(forecast).to have_key(:data)
      expect(forecast[:data]).to be_a(Hash)

      expect(forecast[:data]).to have_key(:id)
      expect(forecast[:data][:id]).to eq(nil)

      expect(forecast[:data]).to have_key(:type)
      expect(forecast[:data][:type]).to be_a(String)
      expect(forecast[:data][:type]).to eq('forecast')

      expect(forecast[:data]).to have_key(:attributes)
      expect(forecast[:data][:attributes]).to be_a(Hash)

      attributes = forecast[:data][:attributes]

      expect(attributes).to have_key(:current_weather)
      expect(attributes[:current_weather]).to be_a(Hash)

      expect(attributes[:current_weather]).to have_key(:datetime)
      expect(attributes[:current_weather][:datetime]).to be_a(String)

      expect(attributes[:current_weather]).to have_key(:sunrise)
      expect(attributes[:current_weather][:sunrise]).to be_a(String)

      expect(attributes[:current_weather]).to have_key(:sunset)
      expect(attributes[:current_weather][:sunset]).to be_a(String)

      expect(attributes[:current_weather]).to have_key(:temperature)
      expect(attributes[:current_weather][:temperature]).to be_a(Float)

      expect(attributes[:current_weather]).to have_key(:feels_like)
      expect(attributes[:current_weather][:feels_like]).to be_a(Float)

      expect(attributes[:current_weather]).to have_key(:humidity)
      expect(attributes[:current_weather][:humidity]).to be_a(Integer)

      expect(attributes[:current_weather]).to have_key(:uvi)
      expect(attributes[:current_weather][:uvi]).to be_a(Float)

      expect(attributes[:current_weather]).to have_key(:visibility)
      expect(attributes[:current_weather][:visibility]).to be_a(Integer)

      expect(attributes[:current_weather]).to have_key(:conditions)
      expect(attributes[:current_weather][:conditions]).to be_a(String)

      expect(attributes[:current_weather]).to have_key(:icon)
      expect(attributes[:current_weather][:icon]).to be_a(String)

      expect(attributes[:current_weather]).not_to have_key(:pressure)
      expect(attributes[:current_weather]).not_to have_key(:dew_point)
      expect(attributes[:current_weather]).not_to have_key(:clouds)
      expect(attributes[:current_weather]).not_to have_key(:wind_speed)
      expect(attributes[:current_weather]).not_to have_key(:wind_deg)
      expect(attributes[:current_weather]).not_to have_key(:wind_gust)
      expect(attributes[:current_weather]).not_to have_key(:weather)

      expect(attributes).to have_key(:daily_weather)
      expect(attributes[:daily_weather]).to be_a(Array)
      expect(attributes[:daily_weather].size).to eq(5)

      expect(attributes[:daily_weather].first).to have_key(:date)
      expect(attributes[:daily_weather].first[:date]).to be_a(String)

      expect(attributes[:daily_weather].first).to have_key(:sunrise)
      expect(attributes[:daily_weather].first[:sunrise]).to be_a(String)

      expect(attributes[:daily_weather].first).to have_key(:sunset)
      expect(attributes[:daily_weather].first[:sunset]).to be_a(String)

      expect(attributes[:daily_weather].first).to have_key(:max_temp)
      expect(attributes[:daily_weather].first[:max_temp]).to be_a(Float)

      expect(attributes[:daily_weather].first).to have_key(:min_temp)
      expect(attributes[:daily_weather].first[:min_temp]).to be_a(Float)

      expect(attributes[:daily_weather].first).to have_key(:conditions)
      expect(attributes[:daily_weather].first[:conditions]).to be_a(String)

      expect(attributes[:daily_weather].first).to have_key(:icon)
      expect(attributes[:daily_weather].first[:icon]).to be_a(String)

      expect(attributes[:daily_weather].first).not_to have_key(:temp)
      expect(attributes[:daily_weather].first).not_to have_key(:feels_like)
      expect(attributes[:daily_weather].first).not_to have_key(:pressure)
      expect(attributes[:daily_weather].first).not_to have_key(:humidity)
      expect(attributes[:daily_weather].first).not_to have_key(:dew_point)
      expect(attributes[:daily_weather].first).not_to have_key(:wind_speed)
      expect(attributes[:daily_weather].first).not_to have_key(:wind_deg)
      expect(attributes[:daily_weather].first).not_to have_key(:clouds)
      expect(attributes[:daily_weather].first).not_to have_key(:visibility)
      expect(attributes[:daily_weather].first).not_to have_key(:weather)
      expect(attributes[:daily_weather].first).not_to have_key(:pop)
      expect(attributes[:daily_weather].first).not_to have_key(:uvi)

      expect(attributes).to have_key(:hourly_weather)
      expect(attributes[:hourly_weather]).to be_a(Array)
      expect(attributes[:hourly_weather].size).to eq(8)

      expect(attributes[:hourly_weather].first).to have_key(:time)
      expect(attributes[:hourly_weather].first[:time]).to be_a(String)

      expect(attributes[:hourly_weather].first).to have_key(:predicted_temp)
      expect(attributes[:hourly_weather].first[:predicted_temp]).to be_a(Float)

      expect(attributes[:hourly_weather].first).to have_key(:wind_speed)
      expect(attributes[:hourly_weather].first[:wind_speed]).to be_a(Float)

      expect(attributes[:hourly_weather].first).to have_key(:wind_direction)
      expect(attributes[:hourly_weather].first[:wind_direction]).to be_a(Integer)

      expect(attributes[:hourly_weather].first).to have_key(:conditions)
      expect(attributes[:hourly_weather].first[:conditions]).to be_a(String)

      expect(attributes[:hourly_weather].first).to have_key(:icon)
      expect(attributes[:hourly_weather].first[:icon]).to be_a(String)

      expect(attributes[:hourly_weather].first).not_to have_key(:feels_like)
      expect(attributes[:hourly_weather].first).not_to have_key(:pressure)
      expect(attributes[:hourly_weather].first).not_to have_key(:humidity)
      expect(attributes[:hourly_weather].first).not_to have_key(:dew_point)
      expect(attributes[:hourly_weather].first).not_to have_key(:clouds)
      expect(attributes[:hourly_weather].first).not_to have_key(:visibility)
      expect(attributes[:hourly_weather].first).not_to have_key(:weather)
      expect(attributes[:hourly_weather].first).not_to have_key(:pop)
    end
  end

  it "returns error message when location not found" do
    VCR.use_cassette('no_location') do
      get '/api/v1/forecast?location=kjdhfkjashfkjhaskjdfhaksh'
      expect(response.status).to eq(400)

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast).to have_key(:errors)
      expect(forecast[:errors]).to eq("Location not found")
    end
  end
end
