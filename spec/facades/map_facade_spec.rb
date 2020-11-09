require 'rails_helper'

describe MapFacade do
  it "returns lat long for a location" do
    params = { location: 'denver,co' }
    lat_lng = MapFacade.lat_lng(params)

    expect(lat_lng).to be_a(Hash)
    expect(lat_lng).to have_key(:lat)
    expect(lat_lng[:lat]).to eq(39.738453)
    expect(lat_lng).to have_key(:lng)
    expect(lat_lng[:lng]).to eq(-104.984853)
  end

  xit "refactor with vcr" do

  end
end
