require_relative '../services/Intercom/customer_service'
require_relative '../common/customer_utility'

class SearchesController < ApplicationController

  # GET /searches
  def index
    
  end

  # POST /searches
  def search
    
    @customers = Intercom::CustomerService.new.fetchCustomers params[:filepath]
    @eligible_customers = CustomerUtility.search_customers(@customers, params[:officegps], params[:rangedistance])
     
    output = "Eligible customers for food and drinks within #{params[:rangedistance]} km from location => #{params[:officegps]} are below:\n\n"
    @eligible_customers.map do |customer| 
      output << "Customer #{customer[:user_id]}:   #{customer[:name]} =>#{customer[:location].to_string}\n"
    end
    
    # Extract eligible customers
    send_data output,:type => 'application/txt',:disposition => "attachment; filename=output.txt"
    
  end

  private
    # Only allow a list of trusted parameters through.
    def search_params
      params.require(:search).permit(:filepath, :officegps, :rangedistance)
    end
end
