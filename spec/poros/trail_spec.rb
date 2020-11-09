require 'rails_helper'

describe Trail do
  it "exists and has attributes" do
    data = File.read('./spec/fixtures/trails.json')

    trails_info = JSON.parse(data, symbolize_names: true)

    trail_info = trails_info[:trails].first

    trail = Trail.new(trail_info)

    expect(trail).to be_a(Trail)

    expect(trail.name).to be_a(String)
    expect(trail.name).to eq( "Boulder Skyline Traverse")

    expect(trail.summary).to be_a(String)
    expect(trail.summary).to eq("The classic long mountain route in Boulder.")

    expect(trail.difficulty).to be_a(String)
    expect(trail.difficulty).to eq("black")

    expect(trail.location).to be_a(String)
    expect(trail.location).to eq("Superior, Colorado")
    
    expect(trail.distance_to_trail).to be_a(Float)
    expect(trail.distance_to_trail).to eq(1.0)
  end
end
