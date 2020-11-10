require 'rails_helper'

describe Image do
  it "exists and has attributes" do
    json = File.read('./spec/fixtures/images.json')
    images_data = JSON.parse(json, symbolize_names: true)
    image_data = images_data[:photos].first
    location = {location: 'denver,co'}
    image = Image.new(image_data, location)

    expect(image).to be_a(Image)
    expect(image.location).to eq('denver,co')
    expect(image.url).to eq("https://images.pexels.com/photos/2706750/pexels-photo-2706750.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800")
    expect(image.credit[:author]).to eq("Thomas Ward")
    expect(image.credit[:source]).to eq("pexels.com")
  end
end
