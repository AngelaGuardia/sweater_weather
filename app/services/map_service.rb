class MapService
  def self.lat_lng(params)
    get_latlng_parsed('/geocoding/v1/address', params)
  end

  def self.get_latlng_parsed(url, params = {})
    response = conn.get(url) do |req|
      req.params[:key] = ENV['MAPQUEST_API_KEY']
      req.params[:location] = params[:location]
      req.params[:maxResults] = 1
    end

    location = JSON.parse(response.body, symbolize_names: true)[:results].first[:locations].first

    return nil if location[:adminArea5].empty?

    location[:latLng]
  end

  def self.travel_info(roadtrip_info)
    sec = directions(roadtrip_info)[:route][:time]
    if sec
      format_time(sec)
    else
      {
        formatted_time: "impossible route",
        hours: false
      }
    end
  end

  def self.format_time(sec)
    hours = if sec / 60 % 60 >= 30
              sec / 3600 + 1
            else
              sec / 3600
            end

    {
      formatted_time: "%02d:%02d" % [sec / 3600, sec / 60 % 60, sec % 60],
      hours: hours
    }
  end

  def self.directions(roadtrip_info)
    get_directions_parsed('/directions/v2/route', roadtrip_info)
  end

  def self.get_directions_parsed(url, info)
    response = conn.get(url) do |req|
      req.params[:key] = ENV['MAPQUEST_API_KEY']
      req.params[:from] = info[:origin]
      req.params[:to] = info[:destination]
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new('http://www.mapquestapi.com')
  end
end
