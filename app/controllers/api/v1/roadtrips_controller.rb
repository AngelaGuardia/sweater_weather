class Api::V1::RoadtripsController < ApplicationController
  def create
    roadtrip_info = JSON.parse(request.raw_post, symbolize_names: true)
    render json: RoadtripSerializer.new(RoadtripFacade.trip(roadtrip_info))
  end
end
