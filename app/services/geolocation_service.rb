class GeolocationService
  def self.lat_lng(params)
    get_parsed_json('/geocoding/v1/address', params)
  end

  def self.directions(start, destination)
    params = {from: start, to: destination}
    get_parsed_json_2('/directions/v2/route', params)
  end

  def self.get_parsed_json(url, params = {})
    response = conn.get(url) do |req|
      req.params[:key] = ENV['MAPQUEST_API_KEY']
      req.params[:location] = params[:location]
      req.params[:maxResults] = 1
    end

    JSON.parse(response.body, symbolize_names: true)[:results].first[:locations].first[:latLng]
  end

  def self.get_parsed_json_2(url, params = {})
    response = conn.get(url) do |req|
      req.params[:key] = ENV['MAPQUEST_API_KEY']
      req.params[:to] = params[:to]
      req.params[:from] = params[:from]
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new('http://www.mapquestapi.com')
  end
end
