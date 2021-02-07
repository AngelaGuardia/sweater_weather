class Image
  attr_reader :location,
              :url,
              :credit

  def initialize(data, params)
    @location = params[:location]
    @url = data[:src][:portrait]
    @credit = { source: 'pexels.com', author: data[:photographer] }
  end
end
