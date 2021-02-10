require 'rails_helper'

describe 'Sessions request' do
  before :each do
    payload =  {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post '/api/v1/users', params: payload.to_json
  end

  it "returns user info when correct credentials supplied" do
    payload =  {
              "email": "whatever@example.com",
              "password": "password",
            }

    post '/api/v1/sessions', params: payload.to_json

    expect(response.status).to eq(200)

    parsed = JSON.parse(response.body, symbolize_names: true)

    user_serializer_structure_check(parsed)
    expect(parsed[:data][:attributes][:email]).to eq("whatever@example.com")
  end

  it "returns an error if bad credentials are given - password" do
    payload =  {
              "email": "whatever@example.com",
              "password": "wrong password",
            }

    post '/api/v1/sessions', params: payload.to_json

    expect(response.status).to eq(401)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:errors]).to eq("Bad credentials")
  end

  it "returns an error if bad credentials are given - email" do
    payload =  {
              "email": "wrong email",
              "password": "password",
            }

    post '/api/v1/sessions', params: payload.to_json

    expect(response.status).to eq(401)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:errors]).to eq("Bad credentials")
  end
end
