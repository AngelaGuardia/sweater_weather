class ImageService
  def self.new_image(params)
    get_parsed_json('/v1/search', params)
  end

  def self.get_parsed_json(url, params)
    response = conn.get('/v1/search') do |req|
      req.headers[:authorization] = ENV['PEXELS_API_KEY']
      req.params[:query] = params[:location]
    end

    parsed_json = JSON.parse(response.body, symbolize_names: true)
    parsed_json[:photos].first
  end

  private

  def self.conn
    Faraday.new('https://api.pexels.com')
  end
end
