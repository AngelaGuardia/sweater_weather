require 'rails_helper'

describe ForecastFacade do
  it "returns a forecast for a latitude and longitude" do
    VCR.use_cassette('denver_forecast') do
      params = { lat: 39.738453, lng: -104.984853 }

      forecast = ForecastFacade.forecast(params)

      expect(forecast).to be_a(Forecast)
    end
  end
end
