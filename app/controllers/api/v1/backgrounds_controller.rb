class Api::V1::BackgroundsController < ApplicationController
  def index
    render json: ImageSerializer.new(ImageFacade.new_image(params))
  end
end
