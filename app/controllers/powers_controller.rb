class PowersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_error
    def index
        render json: Power.all, status: :ok
    end
    def show
        power = find_power
        render json: power, status: :ok
    end
    def update
        power = find_power
        power.update!(update_params)
        render json: power, status: :ok
    end

    private

    def find_power
        Power.find(params[:id])
    end

    def render_unprocessable_entity_error(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def update_params
        params.permit(:description)
    end
end
