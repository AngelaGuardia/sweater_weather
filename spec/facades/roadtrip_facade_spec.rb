require 'rails_helper'

describe RoadtripFacade do
  it "returns a roadtrip" do
    roadtrip_info = {
                      origin: "Denver,CO",
                      destination: "Pueblo,CO",
                      api_key: "jgn983hy48thw9begh98h4539h4"
                    }

    roadtrip = RoadtripFacade.trip(roadtrip_info)

    expect(roadtrip).to be_a(Roadtrip)
  end
end
