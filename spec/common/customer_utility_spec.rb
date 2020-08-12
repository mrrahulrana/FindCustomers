require "rails_helper"
require_relative '../../app/models/gps_location'
require_relative '../../app/common/customer_utility'

RSpec.describe CustomerUtility do
    describe '#search_customers' do
        customers = [{"user_id": "12", "name": "Christina McArdle", "location": GpsLocation.new(latitude:52.986375,longitude: -6.043701)},
        {"user_id": "1", "name": "Alice Cahill", "location": GpsLocation.new(latitude:51.92893, longitude:-10.27699)},
        {"user_id": "2", "name": "Ian McArdle", "location": GpsLocation.new(latitude:51.8856167, longitude:-10.4240951)},
        {"user_id": "11", "name": "Richard Finnegan", "location": GpsLocation.new(latitude:53.008769, longitude: -6.1056711)}]

        office_gps="53.339428, -6.257664"
        range="100"
        let(:eligible_customers) { CustomerUtility.search_customers(customers, office_gps,range)}
        
      it 'Finds customers within given range' do    
        expect(eligible_customers.count).to eq(2)
      end

      it 'Check customers sorted by user_id' do    
        expect(eligible_customers[0][:user_id]).to eq("11")
      end
    end
  end