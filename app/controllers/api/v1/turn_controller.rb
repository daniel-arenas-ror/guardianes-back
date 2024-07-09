module Api
  module V1
    class TurnController < BaseController
      def index
        turns = Turn
                  .joins(:service_deal)
                  .where(
                    week: params[:week],
                    service_deal: {
                      service_id: params[:service_id]
                    }
                  )
                  .order(key: :desc)

        render json: turns
      end
    end
  end
end
