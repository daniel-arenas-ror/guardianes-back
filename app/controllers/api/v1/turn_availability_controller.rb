module Api
  module V1
    class TurnAvailabilityController < BaseController
      def index
        turn_availabilities = TurnAvailability.all

        render json: turn_availabilities
      end

      def create
        turn_availability = TurnAvailability.new(turn_availability_params)

        if turn_availability.save
          render json: turn_availability, status: :ok
        else
          render json: turn_availability.errors.full_messages, status: status
        end
      end

      def destroy

        head :ok
      end

      private

      def turn_availability_params
        params.required(:turn_availability).permit(
          :turn_id,
          :worker_id
        )
      end
    end
  end
end
