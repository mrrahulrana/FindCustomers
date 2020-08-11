require 'open-uri'
require_relative '../../models/gps_location'

module Intercom
  class CustomerService
    
    def fetchCustomers(url)
      customers  = URI.open(url) {|file| file.readlines.map{|cus| parse_customer(cus)} }
    end

    def parse_customer(customer)
      parsed = JSON.parse(customer)
      
      { user_id: Integer(parsed['user_id'].to_s, 10),
        name: parsed['name'].to_s,
        location: GpsLocation.new(latitude: Float(parsed['latitude']),
                                  longitude: Float(parsed['longitude'])) }
    end

  end
end
