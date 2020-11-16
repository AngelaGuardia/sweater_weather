class Api::V1::BackgroundsController < ApplicationController
  def index
    image = ImageFacade.new_image(params)
    if image
      render json: ImageSerializer.new(image)
    else
      render json: { errors: "No image found" }.to_json, status: :bad_request
    end
  end
end
