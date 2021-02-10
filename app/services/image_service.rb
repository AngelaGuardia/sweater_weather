class ImageService
  def self.new_image(params)
    get_parsed_json('/search/photos', params)
  end

  def self.get_parsed_json(url, params)
    response = conn.get(url) do |req|
      req.params[:client_id] = ENV['UNSPLASH_API_KEY']
      req.params[:query] = params[:location]
      req.params[:page] = 1
      req.params[:per_page] = 1
      req.params[:orientation] = 'landscape'
    end

    parsed_json = JSON.parse(response.body, symbolize_names: true)[:results]
    parsed_json.sample if parsed_json
  end

  private

  def self.conn
    Faraday.new('https://api.unsplash.com')
  end
end
