module Api
  module V1
    class TurnAvailabilityController < BaseController
      before_action :load_turn_availability, only: %w(destroy)

      def index
        turn_availabilities = TurnAvailability
                                .includes(turn: :service_deal)
                                .where(turn: {
                                  week: params[:week],
                                  service_deals: {
                                    service_id: params[:service_id]
                                  }
                                })

        render json: turn_availabilities
      end

      def create
        turn_availability = TurnAvailability.new(turn_availability_params)

        if turn_availability.save
          TurnAssignation.new(
            week: turn_availability.turn.week,
            deal_id: turn_availability.turn.service_deal.deal_id
          ).process

          render json: turn_availability, status: :ok
        else
          render json: turn_availability.errors.full_messages, status: status
        end
      end

      def destroy
        turn_assignation = TurnAssignation.new(
          week: @turn_availability.turn.week,
          deal_id: @turn_availability.turn.service_deal.deal_id
        )

        @turn_availability.destroy

        turn_assignation.process

        head :ok
      end

      private

      def turn_availability_params
        params.required(:turn_availability).permit(
          :turn_id,
          :worker_id
        )
      end

      def load_turn_availability
        @turn_availability = TurnAvailability.find(params[:id])
      end
    end
  end
end
