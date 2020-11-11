require 'rails_helper'

describe Roadtrip do
  it "exists and has attributes" do
    VCR.use_cassette('denver_pueblo_roadtrip') do
      roadtrip_info = {
                        origin: "Denver,CO",
                        destination: "Pueblo,CO",
                        api_key: "jgn983hy48thw9begh98h4539h4"
                      }

      travel_info = {
                      formatted_time: "01:43",
                      hours: 2
                    }

      lat_lng = { lat: 38.265425, lng: -104.610415 }

      forecast = ForecastFacade.forecast(lat_lng)

      roadtrip = Roadtrip.new({ roadtrip: roadtrip_info, travel: travel_info, forecast: forecast})

      expect(roadtrip).to be_a(Roadtrip)

      expect(roadtrip.start_city).to eq("Denver,CO")
      expect(roadtrip.end_city).to eq("Pueblo,CO")
      expect(roadtrip.travel_time).to eq("01:43")
      expect(roadtrip.weather_at_eta).to be_a(Hash)
      expect(roadtrip.weather_at_eta[:temperature]).to eq(39.02)
      expect(roadtrip.weather_at_eta[:conditions]).to eq("few clouds")
    end
  end
end
