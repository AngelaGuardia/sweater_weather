class Api::V1::RoadtripsController < ApplicationController
  def create
    roadtrip_info = JSON.parse(request.raw_post, symbolize_names: true)

    if User.find_by(api_key: roadtrip_info[:api_key])
      render json: RoadtripSerializer.new(RoadtripFacade.trip(roadtrip_info))
    else
      render json: { errors: "Invalid Key" }, status: :unauthorized
    end
  end
end
