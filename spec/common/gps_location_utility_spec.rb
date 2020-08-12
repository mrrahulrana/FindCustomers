require "rails_helper"
require_relative '../../app/models/gps_location'
require_relative '../../app/common/gps_location_utility'

RSpec.describe GpsLocationUtility do
    describe '#calculate_distance' do
      it 'distance between Dublin office and customer' do
        source = GpsLocation.new(latitude: 53.339428, longitude: -6.257664)
        destination = GpsLocation.new(latitude: 52.986375, longitude: -6.043701)
        distance = GpsLocationUtility.calculate_distance(source, destination)
        expect(distance).to eq(41768.72550083565)
      end
  
      it 'distance of same office location' do
        location = GpsLocation.new(latitude: 53.339428, longitude: -6.257664)
        distance = GpsLocationUtility.calculate_distance(location, location)
        expect(distance).to eq(0)
      end
  
    end
  end