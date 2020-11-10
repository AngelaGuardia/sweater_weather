class MapFacade
  def self.lat_lng(params)
    MapService.lat_lng(params)
  end

  def self.travel_info(roadtrip_info)
    MapService.travel_info(roadtrip_info)
  end
end
# QUESTION: Is this facade requires or could I have called the service directly from the controller?

# QUESTION: Are facades only required when they will be creating POROs/Accessing the DB?
