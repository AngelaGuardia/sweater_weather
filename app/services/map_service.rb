class MapService
  def self.lat_lng(params)
    get_latlng_parsed('/geocoding/v1/address', params)
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

  private

  def self.conn
    Faraday.new('http://www.mapquestapi.com') do |faraday|
      faraday.params[:key] = ENV['MAPQUEST_API_KEY']
    end
  end

  def self.get_latlng_parsed(url, params = {})
    response = conn.get(url) do |req|
      req.params[:location] = params[:location]
      req.params[:maxResults] = 1
    end

    location = JSON.parse(response.body, symbolize_names: true)[:results].first[:locations].first

    return nil if !location || location[:adminArea5].empty?

    location[:latLng]
  end


  def self.directions(roadtrip_info)
    get_directions_parsed('/directions/v2/route', roadtrip_info)
  end

  def self.get_directions_parsed(url, info)
    response = conn.get(url) do |req|
      req.params[:from] = info[:origin]
      req.params[:to] = info[:destination]
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.format_time(sec)
    # format time &
    # round to the nearest hour (used to calculate forecast at time of arrival)
    # TODO: This should maybe be split into two methods
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
end
