require 'rails_helper'

describe 'Roadtrip request' do
  before :each do
    payload =  {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post '/api/v1/users', params: payload.to_json

    @user = User.last
  end

  it "it returns roadtrip info" do
    VCR.use_cassette('denver_pueblo_roadtrip') do
      payload = {
                  "origin": "Denver,CO",
                  "destination": "Pueblo,CO",
                  "api_key": @user.api_key
                }

      post '/api/v1/road_trip', params: payload.to_json
      expect(response).to be_successful

      parsed = JSON.parse(response.body, symbolize_names: true)

      roadtrip_serializer_structure_check(parsed)

      expect(parsed[:data][:attributes][:start_city]).to eq("Denver,CO")
      expect(parsed[:data][:attributes][:end_city]).to eq("Pueblo,CO")
      expect(parsed[:data][:attributes][:travel_time]).to eq("01:43")
      expect(parsed[:data][:attributes][:weather_at_eta][:temperature]).to eq(39.02)
      expect(parsed[:data][:attributes][:weather_at_eta][:conditions]).to eq("few clouds")
    end
  end

  it "returns Unauthorized status when wrong key is provided" do
    payload = {
                "origin": "Denver,CO",
                "destination": "Pueblo,CO",
                "api_key": "wrong key"
              }

    post '/api/v1/road_trip', params: payload.to_json
    expect(response.status).to eq(401)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:errors]).to eq("Invalid Key")
  end

  it "returns Unauthorized status when no key is provided" do
    payload = {
                "origin": "Denver,CO",
                "destination": "Pueblo,CO",
                "api_key": ""
              }

    post '/api/v1/road_trip', params: payload.to_json
    expect(response.status).to eq(401)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:errors]).to eq("Invalid Key")
  end

  it "returns approtiate response when route is impossible" do
    VCR.use_cassette('denver_tokyo_roadtrip') do
      payload = {
                  "origin": "Denver,CO",
                  "destination": "Tokyo",
                  "api_key": @user.api_key
                }

      post '/api/v1/road_trip', params: payload.to_json
      expect(response).to be_successful

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed[:data][:attributes][:start_city]).to eq("Denver,CO")
      expect(parsed[:data][:attributes][:end_city]).to eq("Tokyo")
      expect(parsed[:data][:attributes][:travel_time]).to eq("impossible route")
      expect(parsed[:data][:attributes][:weather_at_eta][:temperature]).to eq(nil)
    end
  end
end
