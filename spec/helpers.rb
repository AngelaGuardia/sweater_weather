module Helpers
  def user_serializer_structure_check(user)
    expect(user).to have_key(:data)
    expect(user[:data]).to be_a(Hash)

    expect(user[:data]).to have_key(:type)
    expect(user[:data][:type]).to be_a(String)
    expect(user[:data][:type]).to eq('user')

    expect(user[:data]).to have_key(:id)
    expect(user[:data][:id]).to be_a(String)

    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to be_a(Hash)

    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes][:email]).to be_a(String)

    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes][:api_key]).to be_a(String)
  end

  def roadtrip_serializer_structure_check(roadtrip)
    expect(roadtrip).to have_key(:data)
    expect(roadtrip[:data]).to be_a(Hash)

    expect(roadtrip[:data]).to have_key(:type)
    expect(roadtrip[:data][:type]).to be_a(String)
    expect(roadtrip[:data][:type]).to eq('roadtrip')

    expect(roadtrip[:data]).to have_key(:id)
    expect(roadtrip[:data][:id]).to eq(nil)

    expect(roadtrip[:data]).to have_key(:attributes)
    expect(roadtrip[:data][:attributes]).to be_a(Hash)

    expect(roadtrip[:data][:attributes]).to have_key(:start_city)
    expect(roadtrip[:data][:attributes][:start_city]).to be_a(String)

    expect(roadtrip[:data][:attributes]).to have_key(:end_city)
    expect(roadtrip[:data][:attributes][:end_city]).to be_a(String)

    expect(roadtrip[:data][:attributes]).to have_key(:travel_time)
    expect(roadtrip[:data][:attributes][:travel_time]).to be_a(String)

    expect(roadtrip[:data][:attributes]).to have_key(:weather_at_eta)
    expect(roadtrip[:data][:attributes][:weather_at_eta]).to be_a(Hash)

    expect(roadtrip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(roadtrip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)

    expect(roadtrip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(roadtrip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end
end
