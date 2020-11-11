require 'rails_helper'

describe ImageService do
  it "returns image information" do
      VCR.use_cassette('denver_image') do

      params = { location: "denver,co" }

      image_data = ImageService.new_image(params)

      expect(image_data).to be_a(Hash)

      expect(image_data).to have_key(:photographer)
      expect(image_data[:photographer]).to be_a(String)
      expect(image_data[:photographer]).to eq('fauxels')

      expect(image_data).to have_key(:src)
      expect(image_data[:src]).to be_a(Hash)

      expect(image_data[:src]).to have_key(:portrait)
      expect(image_data[:src][:portrait]).to be_a(String)
      expect(image_data[:src][:portrait]).to eq("https://images.pexels.com/photos/3184423/pexels-photo-3184423.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800")
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
