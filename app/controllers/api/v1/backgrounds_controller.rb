class Api::V1::BackgroundsController < ApplicationController
  def index
    conn = Faraday.new('https://api.pexels.com')

    response = conn.get('/v1/search') do |req|
      req.headers[:authorization] = ENV['PEXELS_API_KEY']
      req.params[:query] = params[:location]
    end

    parsed_json = JSON.parse(response.body, symbolize_names: true)

    image_data = parsed_json[:photos].first

    render json: ImageSerializer.new(Image.new(image_data, params))
  end
end
