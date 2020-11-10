require 'rails_helper'

describe 'User request' do
  it "add user to db if correct info is given" do
    payload =  {
              "email": "whatever@example.com",
              "password": "password",
              "password_confirmation": "password"
            }

    post '/api/v1/users', params: payload.to_json

    expect(response.status).to eq(201)
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to be_a(Hash)

    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data][:type]).to be_a(String)
    expect(parsed[:data][:type]).to eq('user')

    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data][:id]).to be_a(String)

    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to be_a(Hash)

    expect(parsed[:data][:attributes]).to have_key(:email)
    expect(parsed[:data][:attributes][:email]).to be_a(String)
    expect(parsed[:data][:attributes][:email]).to eq("whatever@example.com")

    expect(parsed[:data][:attributes]).to have_key(:api_key)
    expect(parsed[:data][:attributes][:api_key]).to be_a(String)

    user = User.last

    expect(user.email).to eq("whatever@example.com")
  end
end
