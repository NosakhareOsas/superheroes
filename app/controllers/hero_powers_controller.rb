class HeroPowersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_error
    
    def create
        hero_power = HeroPower.create!(post_params)
        hero = Hero.find(hero_power[:hero_id])  ###or use hero_power.hero
        render json: hero, serializer: HeroShowSerializer, status: :created  #include '**' multiple levels  serializer: HeroShowSerializer
    end

    private

    def post_params
        params.permit(:strength, :hero_id, :power_id)
    end

    def render_unprocessable_entity_error(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
