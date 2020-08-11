class GpsLocationUtility
    def self.calculate_distance(source, destination)
        loc1 = source.latitude_longitude
        loc2 = destination.latitude_longitude
        rad_per_deg = Math::PI / 180        # converts degree to radians
        earth_radius_km = 6371              # Earth radius in kilometers
        earth_radius_meters = earth_radius_km * 1000             # Radius in meters

        lat1, lng1 = loc1.map {|i| i * rad_per_deg }
        lat2, lng2 = loc2.map {|i| i * rad_per_deg }

        sin_lat1 = Math.sin(lat1)
        sin_lat2 = Math.sin(lat2)
        cos_lat1 = Math.cos(lat1)
        cos_lat2 = Math.cos(lat2)
        sin_delta_lng = Math.sin(lng2 - lng1)
        cos_delta_lng = Math.cos(lng2 - lng1)

        atan_y = Math.sqrt((cos_lat2 * sin_delta_lng)**2 +
                        (cos_lat1 * sin_lat2 - sin_lat1 * cos_lat2 * cos_delta_lng)**2)
        atan_x = sin_lat1 * sin_lat2 + cos_lat1 * cos_lat2 * cos_delta_lng

        Math.atan2(atan_y, atan_x) * earth_radius_meters # distance in meters.
    end

end