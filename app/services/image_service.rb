class ImageService
  def self.new_image(params)
    get_parsed_json('/v1/search', params)
  end

  def self.get_parsed_json(url, params)
    response = conn.get(url) do |req|
      req.headers[:authorization] = ENV['PEXELS_API_KEY']
      req.params[:query] = params[:location]
    end

    parsed_json = JSON.parse(response.body, symbolize_names: true)[:photos]
    parsed_json.first if parsed_json
  end

  private

  def self.conn
    Faraday.new('https://api.pexels.com')
    # TODO: Add api key here instead
  end
end
