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

    user_serializer_structure_check(parsed)

    user = User.last

    expect(user.email).to eq("whatever@example.com")
  end

  it "returns error messages if required fields are blank" do
    payload =  {
              "email": "",
              "password": "",
              "password_confirmation": ""
            }

    post '/api/v1/users', params: payload.to_json

    expect(response.status).to eq(400)
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:errors].include? "Email can't be blank").to be_truthy
    expect(parsed[:errors].include? "Password can't be blank").to be_truthy
    expect(parsed[:errors].include? "Password confirmation doesn't match Password").to be_truthy
  end

  it "returns error messages if required fields are incorrect" do
    payload =  {
      "email": "email@email.com",
      "password": "123",
      "password_confirmation": "abc"
    }

    post '/api/v1/users', params: payload.to_json

    expect(response.status).to eq(400)
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:errors].include? "Password confirmation doesn't match Password").to be_truthy
  end

  it "return an error message if email is not unique" do
    payload =  {
              "email": "whatever@example.com",
              "password": "password",
              "password_confirmation": "password"
            }

    post '/api/v1/users', params: payload.to_json
    post '/api/v1/users', params: payload.to_json

    expect(response.status).to eq(400)
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:errors].include? "Email has already been taken").to be_truthy
  end
end
