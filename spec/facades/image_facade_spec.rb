require 'rails_helper'

describe ImageFacade do
  it "returns and image" do
    VCR.use_cassette('denver_image') do
      params = { location: "denver,co" }

      image = ImageFacade.new_image(params)

      expect(image).to be_an(Image)
    end
  end

  it "returns nil if no image found" do
      VCR.use_cassette('no_image') do

      params = { location: "kjdhfkjashfkjhaskjdfhaksh" }

      image_data = ImageFacade.new_image(params)

      expect(image_data).to eq(nil)
    end
  end
end
