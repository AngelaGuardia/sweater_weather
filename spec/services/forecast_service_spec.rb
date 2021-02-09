require 'rails_helper'

describe ForecastService do
  it "returns forecast for given latitude and longitude" do
    VCR.use_cassette('denver_forecast') do
      params = {:lat_lng=>{:lat=>39.738453, :lng=>-104.984853}, :units=>nil}

      forecast = ForecastService.forecast(params)

      expect(forecast).to be_a(Hash)

      expect(forecast).to have_key(:lat)
      expect(forecast[:lat]).to be_a(Float)

      expect(forecast).to have_key(:lon)
      expect(forecast[:lon]).to be_a(Float)

      expect(forecast).to have_key(:current)
      expect(forecast[:current]).to be_a(Hash)

      expect(forecast).to have_key(:hourly)
      expect(forecast[:hourly]).to be_a(Array)

      expect(forecast).to have_key(:daily)
      expect(forecast[:daily]).to be_a(Array)
    end
  end
end
