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
                  .order(turn_date: :asc, hour: :asc)

        render json: turns
      end
    end
  end
end
