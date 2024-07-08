module Api
  module V1
    class DealController < BaseController
      before_action :load_deal, only: %w(show)

      def show
        render jsonapi: @deal
      end

      private

      def load_deal
        @deal = Deal.find(params[:id])
      end
    end
  end
end
