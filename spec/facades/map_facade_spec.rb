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

  it "returns formatted_time and rounded hours" do
    roadtrip_info = {
                      origin: "Denver,CO",
                      destination: "Pueblo,CO",
                      api_key: "jgn983hy48thw9begh98h4539h4"
                    }

    time = MapService.travel_info(roadtrip_info)

    expect(time).to be_a(Hash)

    expect(time).to have_key(:formatted_time)
    expect(time[:formatted_time]).to be_a(String)
    expect(time[:formatted_time]).to eq("01:43")

    expect(time).to have_key(:hours)
    expect(time[:hours]).to be_a(Integer)
    expect(time[:hours]).to eq(2)
  end

  xit "refactor with vcr" do

  end
end
