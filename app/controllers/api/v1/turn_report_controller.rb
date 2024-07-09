module Api
  module V1
    class TurnReportController < BaseController
      def index
        turns_by_worker = Turn
                            .joins(:service_deal)
                            .where(
                              week: params[:week],
                              service_deal: {
                                service_id: params[:service_id]
                              }
                            )
                            .group(:worker_id)
                            .count

        render json: turns_by_worker
      end
    end
  end
end
