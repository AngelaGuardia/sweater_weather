require 'rails_helper'

describe 'Background Request' do
  it "returns an image for a given location" do
    VCR.use_cassette('denver_image') do
      get '/api/v1/backgrounds?location=denver,co'
      expect(response).to be_successful

      image = JSON.parse(response.body, symbolize_names: true)

      expect(image).to have_key(:data)
      expect(image[:data]).to be_a(Hash)

      expect(image[:data]).to have_key(:type)
      expect(image[:data][:type]).to be_a(String)
      expect(image[:data][:type]).to eq('image')

      expect(image[:data]).to have_key(:id)
      expect(image[:data][:id]).to eq(nil)

      expect(image[:data]).to have_key(:attributes)
      expect(image[:data][:attributes]).to be_a(Hash)

      expect(image[:data][:attributes]).to have_key(:location)
      expect(image[:data][:attributes][:location]).to be_a(String)
      expect(image[:data][:attributes][:location]).to eq('denver,co')

      expect(image[:data][:attributes]).to have_key(:url)
      expect(image[:data][:attributes][:url]).to be_a(String)
      expect(image[:data][:attributes][:url]).to eq("https://images.unsplash.com/photo-1578063008687-42d9230cf192?crop=entropy&cs=srgb&fm=jpg&ixid=MXwxODEzNjB8MHwxfHNlYXJjaHwxfHxkZW52ZXIsY298ZW58MHwwfHw&ixlib=rb-1.2.1&q=85")

      expect(image[:data][:attributes]).to have_key(:credit)
      expect(image[:data][:attributes][:credit]).to be_a(Hash)

      expect(image[:data][:attributes][:credit]).to have_key(:source)
      expect(image[:data][:attributes][:credit][:source]).to be_a(String)
      expect(image[:data][:attributes][:credit][:source]).to eq('unsplash.com')

      expect(image[:data][:attributes][:credit]).to have_key(:author)
      expect(image[:data][:attributes][:credit][:author]).to be_a(String)
    end
  end

  it "returns an an error if no image found" do
    VCR.use_cassette('no_image') do
      get '/api/v1/backgrounds?location=kjdhfkjashfkjhaskjdfhaksh'
      expect(response.status).to eq(400)

      image = JSON.parse(response.body, symbolize_names: true)

      expect(image).to have_key(:errors)
      expect(image[:errors]).to eq("No image found")
    end
  end
end
