class Image
  attr_reader :location,
              :url,
              :credit

  def initialize(data, params)
    @location = params[:location]
    @url = data[:urls][:full]
    @credit = { source: 'unsplash.com', author: data[:user][:name] }
  end
end
