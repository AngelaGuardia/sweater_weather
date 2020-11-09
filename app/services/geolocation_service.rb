class GeolocationService
  def self.lat_lng(params)
    get_parsed_json('/geocoding/v1/address', params)
  end

  def self.get_parsed_json(url, params = {})
    response = conn.get(url) do |req|
      req.params[:key] = ENV['MAPQUEST_API_KEY']
      req.params[:location] = params[:location]
      req.params[:maxResults] = 1
    end

    JSON.parse(response.body, symbolize_names: true)[:results].first[:locations].first[:latLng]
  end

  private

  def self.conn
    Faraday.new('http://www.mapquestapi.com')
  end
end
