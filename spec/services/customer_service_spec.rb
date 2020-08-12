require "rails_helper"
require_relative '../../app/services/Intercom/customer_service'
require_relative '../../app/models/gps_location'


RSpec.describe 'Customers file read' do
    describe "#fetchCustomers" do
        CUSTOMERS_URL = 'https://s3.amazonaws.com/intercom-take-home-test/customers.txt'
        let(:customers) { Intercom::CustomerService.new.fetchCustomers CUSTOMERS_URL }
  
      it "lists all the customers" do
        expect(customers.count).to eq(32)
      end
      it { expect(customers).to respond_to(:each) }
      it { expect(customers.length).to satisfy { |v| v >= 1 }  }
      it { expect(customers).to all(have_key(:user_id)) }
     
    end
  end