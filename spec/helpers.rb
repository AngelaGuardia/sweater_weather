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
end
