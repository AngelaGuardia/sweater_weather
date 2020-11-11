require 'rails_helper'

describe ImageFacade do
  it "returns and image" do
    VCR.use_cassette('denver_image') do
      params = { location: "denver,co" }

      image = ImageFacade.new_image(params)

      expect(image).to be_an(Image)
    end
  end
end
