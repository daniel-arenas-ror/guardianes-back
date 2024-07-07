module Api
  module V1
    class TurnAvailabilityController < ActionController::Base
      def index
        turn_availabilities = TurnAvailability.all

        render json: turn_availabilities
      end

      def create
        turn_availabilities = TurnAvailability.new(turn_availability_params)

        if turn_availabilities.create
          render json: turn_availabilities, status: :ok
        else
          render json: turn_availabilities.errors.full_messages, status: status
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
