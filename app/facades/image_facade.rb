class ImageFacade
  def self.new_image(params)
    image_data = ImageService.new_image(params)
    Image.new(image_data, params) if image_data
  end
end
