require 'rails_helper'

RSpec.describe Api::V1::DealController, type: :request do
  let(:deal) { create(:deal) }
  let(:body) { JSON.parse(response.body) }

  describe "GET deal" do
    before do
      get "/api/v1/deal/#{deal.id}"
    end

    it "should return ok" do
      expect(response).to have_http_status(:ok)
    end

    it "should return deal data" do
      expect(body["data"]["type"]).to eq("deals")
      expect(body["data"]["attributes"]["id"]).to eq(deal.id)
      expect(body["data"]["attributes"]["serial"]).to eq(deal.serial)
    end
  end
end
