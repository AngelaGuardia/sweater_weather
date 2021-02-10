require 'rails_helper'

describe Image do
  it "exists and has attributes" do
    json = File.read('./spec/fixtures/images.json')
    images_data = JSON.parse(json, symbolize_names: true)
    image_data = images_data[:results].first
    location = {location: 'montreal'}
    image = Image.new(image_data, location)

    expect(image).to be_a(Image)
    expect(image.location).to eq('montreal')
    expect(image.url).to eq("https://images.unsplash.com/photo-1575540576545-3db8561c29e4?crop=entropy&cs=srgb&fm=jpg&ixid=MXwxODEzNjB8MHwxfHNlYXJjaHwxfHxtb250cmVhbHxlbnwwfDB8fA&ixlib=rb-1.2.1&q=85")
    expect(image.credit[:author]).to eq("Matthias Mullie")
    expect(image.credit[:source]).to eq("unsplash.com")
  end
end
