require "rails_helper"

RSpec.describe SearchesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  context "POST #search" do
    let(:params) do
      {
          filepath: 'https://s3.amazonaws.com/intercom-take-home-test/customers.txt',
          officegps: '53.339428, -6.257664',
          rangedistance: '100'
      }
    end
    before { post :search, params: params }

    it "is successful" do
      expect(response).to have_http_status(200)
    end

    it "shows searched customers" do
      expect(response.body.scan(/Customer /).count).to eq(16)
    end

    it "generates an output txt file" do
      expect(response.headers["Content-Type"]).to eq("application/txt")
      expect(response.headers["Content-Disposition"]).to eq("attachment; filename=output.txt")
    end

    it "returns some customer information with in range of 100 kms." do
      expect(response.body).to include("Ian Kehoe")
      expect(response.body).to include("Lisa Ahearn")
    end

  end
  

end

