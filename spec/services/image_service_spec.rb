require 'rails_helper'

describe ImageService do
  it "returns image information" do
      VCR.use_cassette('denver_image') do

      params = { location: "denver,co" }

      image_data = ImageService.new_image(params)

      expect(image_data).to be_a(Hash)

      expect(image_data).to have_key(:urls)
      expect(image_data[:urls]).to be_a(Hash)
      expect(image_data[:urls]).to have_key(:full)
      expect(image_data[:urls][:full]).to be_a(String)

      expect(image_data).to have_key(:user)
      expect(image_data[:user]).to be_a(Hash)
      expect(image_data[:user]).to have_key(:name)
      expect(image_data[:user][:name]).to be_a(String)
    end
  end

  it "returns nil if no image found" do
      VCR.use_cassette('no_image') do

      params = { location: "kjdhfkjashfkjhaskjdfhaksh" }

      image_data = ImageService.new_image(params)

      expect(image_data).to eq(nil)
    end
  end
end
