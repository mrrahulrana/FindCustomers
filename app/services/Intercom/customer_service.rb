require 'open-uri'

module Intercom
  class CustomerService
    
    def fetchCustomers(url)
      customers  = URI.open(url) {|f| f.readlines.map{|c| JSON.parse(c, symbolize_names: true)} }
      return customers
    end

  end
end
