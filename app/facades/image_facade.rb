class ImageFacade
  def self.new_image(params)
     Image.new(ImageService.new_image(params), params)
  end
end
