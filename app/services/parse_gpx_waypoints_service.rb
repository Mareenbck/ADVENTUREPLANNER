class ParseGpxWaypointsService
  def initialize(gpx_file_path)
    @gpx_file_path = gpx_file_path
  end

  def call
    file = File.open(@gpx_file_path)
    document = Nokogiri::XML(file)
    waypoints = []
    document.root.search("trkpt").each do |gpx|
      long = gpx.attribute('lon').value.to_f
      lat = gpx.attribute('lat').value.to_f
      waypoints << [long, lat]
    end
    return waypoints
  end
end
