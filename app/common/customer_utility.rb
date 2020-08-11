require_relative 'gps_location_utility'

class CustomerUtility

    def self.search_customers(customers, source_location, range)
        gps_point = source_location.split(",")
        range_meters = range.to_f * 1000
        source = GpsLocation.new(latitude: gps_point[0].to_f, longitude: gps_point[1].to_f)
        #find the eligible customers and sort them by user_id
        customers.select { |cust| GpsLocationUtility.calculate_distance(cust[:location],source) <= range_meters } \
                 .sort_by { |cust| cust[:user_id] }
    end

end