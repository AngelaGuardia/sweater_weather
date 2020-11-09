require 'rails_helper'

describe HikeSearch do
  it "exists and has attributes" do
    data = File.read('./spec/fixtures/denver_forecast.json')
    forecast_data = JSON.parse(data, symbolize_names: true)

    forecast = Forecast.new(forecast_data)

    data = File.read('./spec/fixtures/trails.json')

    trails_info = JSON.parse(data, symbolize_names: true)

    location = 'denver,co'

    hike_search = HikeSearch.new(trails_info, forecast, location)

    expect(hike_search).to be_a(HikeSearch)

    expect(hike_search.location).to be_a(String)
    expect(hike_search.location).to eq('denver,co')

    expect(hike_search.forecast).to be_a(Hash)
    expect(hike_search.forecast).to have_key(:summary)
    expect(hike_search.forecast).to have_key(:temperature)

    expect(hike_search.trails).to be_an(Array)
    expect(hike_search.trails.first).to be_a(Trail)
  end
end
