class HeroPowersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_error
    def create
        hero_power = HeroPower.create!(post_params)
        render json: hero_power, include: '**', status: :created #** multiple levels
    end

    private

    def post_params
        params.permit(:strength, :hero_id, :power_id)
    end

    def render_unprocessable_entity_error(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
