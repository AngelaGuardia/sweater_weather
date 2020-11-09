require 'rails_helper'

describe 'Trails request' do
  it "returns current weather and nearby trails" do
    get '/api/v1/trails?location=denver,co'
    expect(response).to be_successful

    trails = JSON.parse(response.body, symbolize_names: true)

    expect(trails).to be_a(Hash)
    expect(trails).to have_key(:data)
    expect(trails[:data]).to be_a(Hash)

    expect(trails[:data]).to have_key(:id)
    expect(trails[:data][:id]).to eq(nil)

    expect(trails[:data]).to have_key(:type)
    expect(trails[:data][:type]).to be_a(String)
    expect(trails[:data][:type]).to eq('trail')

    expect(trails[:data]).to have_key(:attributes)
    expect(trails[:data][:attributes]).to be_a(Hash)

    attributes = trails[:data][:attributes]

    expect(attributes).to have_key(:location)
    expect(attributes[:location]).to be_a(String)
    expect(attributes[:location]).to eq('denver,co')

    expect(attributes).to have_key(:forecast)
    expect(attributes[:forecast]).to be_a(Hash)

    expect(attributes[:forecast]).to have_key(:summary)
    expect(attributes[:forecast][:summary]).to be_a(String)

    expect(attributes[:forecast]).to have_key(:temperature)
    expect(attributes[:forecast][:temperature]).to be_a(Float)

    expect(attributes).to have_key(:trails)
    expect(attributes[:trails]).to be_an(Array)

    expect(attributes[:trails].first).to be_a(Hash)

    trail = attributes[:trails].first

    expect(trail).to have_key(:name)
    expect(trail[:name]).to be_a(String)

    expect(trail).to have_key(:summary)
    expect(trail[:summary]).to be_a(String)

    expect(trail).to have_key(:difficulty)
    expect(trail[:difficulty]).to be_a(String)

    expect(trail).to have_key(:location)
    expect(trail[:location]).to be_a(String)

    expect(trail).to have_key(:distance_to_trail)
    expect(trail[:distance_to_trail]).to be_a(Float)
  end
end
