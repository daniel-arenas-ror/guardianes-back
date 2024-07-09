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
          TurnAssignation.new(turn_availability: turn_availability).process

          render json: turn_availability, status: :ok
        else
          render json: turn_availability.errors.full_messages, status: status
        end
      end

      def destroy
        @turn_availability.destroy

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
