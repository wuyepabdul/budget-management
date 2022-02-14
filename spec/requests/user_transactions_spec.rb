require 'rails_helper'

RSpec.describe "UserTransactions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/user_transactions/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/user_transactions/show"
      expect(response).to have_http_status(:success)
    end
  end

end
