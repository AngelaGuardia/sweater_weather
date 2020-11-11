require 'rails_helper'

describe MapService do
  it "returns lat long for a location" do
    params = { location: 'denver,co' }
    lat_lng = MapService.lat_lng(params)

    expect(lat_lng).to be_a(Hash)
    expect(lat_lng).to have_key(:lat)
    expect(lat_lng[:lat]).to eq(39.738453)
    expect(lat_lng).to have_key(:lng)
    expect(lat_lng[:lng]).to eq(-104.984853)
  end

  it "returns directions for a route" do
    roadtrip_info = {
                      origin: "Denver,CO",
                      destination: "Pueblo,CO",
                      api_key: "jgn983hy48thw9begh98h4539h4"
                    }

    directions = MapService.directions(roadtrip_info)

    expect(directions).to be_a(Hash)
    expect(directions).to have_key(:route)
    expect(directions[:route]).to be_a(Hash)
    expect(directions[:route]).to have_key(:time)
    expect(directions[:route][:time]).to be_a(Integer)
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

  it "formats and rounds time" do
    seconds = 2*3600+34*60+15 #2 hrs 34 min 15 sec
    formatted_time = MapService.format_time(seconds)

    expect(formatted_time[:formatted_time]).to eq("02:34")
    expect(formatted_time[:hours]).to eq(3)
  end

  xit "refactor with vcr" do

  end
end
