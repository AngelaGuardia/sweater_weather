class Image
  attr_reader :location, :url, :credit, :id

  def initialize(data, params)
    @id = nil
    @location = params[:location]
    @url = data[:src][:portrait]
    @credit = { source: 'pexels.com', author: data[:photographer] }
  end
end
