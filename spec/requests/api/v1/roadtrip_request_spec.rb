require 'rails_helper'

describe 'Roadtrip request' do
  it "it returns roadtrip info" do
    payload = {
                "origin": "Denver,CO",
                "destination": "Pueblo,CO",
                "api_key": "jgn983hy48thw9begh98h4539h4"
              }

    post '/api/v1/road_trip', params: payload.to_json
    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    roadtrip_serializer_structure_check(parsed)

    expect(parsed[:data][:attributes][:start_city]).to eq("Denver,CO")
    expect(parsed[:data][:attributes][:end_city]).to eq("Pueblo,CO")
    expect(parsed[:data][:attributes][:travel_time]).to eq("01:43")
    expect(parsed[:data][:attributes][:weather_at_eta][:temperature]).to eq(47.52)
    expect(parsed[:data][:attributes][:weather_at_eta][:conditions]).to eq("few clouds")
  end
end
