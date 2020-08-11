class GpsLocation
  attr_reader :latitude
  attr_reader :longitude

  def initialize(latitude:, longitude:)
    raise ArgumentError.new("Latitude is incorrect: #{latitude}") unless (-90..90).cover?(latitude)
    raise ArgumentError.new("Longitude is incorrect: #{longitude}") unless (-180..180).cover?(longitude)

    @latitude = latitude
    @longitude = longitude
  end

  def latitude_longitude
    [@latitude, @longitude]
  end

  def to_string
    "#{@latitude},#{@longitude}"
  end
end